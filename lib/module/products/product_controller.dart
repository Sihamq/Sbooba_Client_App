import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sboba_app_client/data/data_source/product_data/productData.dart';
import 'package:sboba_app_client/data/models/product_model.dart';

class ProductController extends GetxController {
  List<XFile> imageFileList = [];
  final ImagePicker imagePicker = ImagePicker();
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  void onInit() {
    getProducts();
    super.onInit();
  }

  int? selected = 0;
  getSelected(x) {
    selected = x;
    update();
  }

  Product? product;
  List<ProductItem> productItem = [];
  getProducts() async {
    try {
      var res = await Productdata().getProduct();
      var pro = res["data"] as List;
      productItem = pro.map((e) => ProductItem.fromJson(e)).toList();
      print(productItem);

      product = Product.fromJson(res);
      print(product!.data![0].id);
      update();
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  void selectImages(context) async {
    // imageFileList = [];
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      if (selectedImages.length <= 3 && imageFileList.length <= 3) {
        imageFileList.addAll(selectedImages);
        update();

        print("takeImage");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Exceed allowed number"),
          ),
          // padding: const EdgeInsets.all(8),
          // duration: const Duration(milliseconds: 3000),
        );
      }
    } else {
      print("not selected");
    }
  }

  getProduct() {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
