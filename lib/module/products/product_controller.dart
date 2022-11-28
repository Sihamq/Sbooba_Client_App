import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sboba_app_client/data/data_source/product_data/productData.dart';
import 'package:sboba_app_client/data/models/product_model.dart';
import 'package:sboba_app_client/data/models/show_product.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductItem>> {
  List<XFile> imageFileList = [];
  final ImagePicker imagePicker = ImagePicker();
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  Product? product;
  var productItem = <ProductItem>[].obs;
  var dateController = DateRangePickerController();
  String? startDate, endDate;

  bool isLoading = false;
  void onInit() {
    getProducts();
    final DateTime today = DateTime.now();
    startDate = DateFormat('dd, MMMM yyyy').format(today).toString();
    endDate = DateFormat('dd, MMMM yyyy')
        .format(today.add(Duration(days: 3)))
        .toString();
    super.onInit();
  }

  int? selected = 0;
  getSelected(x) {
    selected = x;
    update();
  }

  ////////////////Get Products////////////////////////////////////////////
  Future getProducts() async {
    try {
      change(productItem.value, status: RxStatus.loading());
      isLoading = true;
      var res = await Productdata().getProduct();
      var pro = res["data"] as List;
      if (res["status"] == 200) {
        isLoading = false;
        productItem.value = pro.map((e) => ProductItem.fromJson(e)).toList();
        change(productItem.value, status: RxStatus.success());
        print(productItem.length);
        if (productItem.isEmpty) {
          change(productItem.value, status: RxStatus.empty());
        }
        product = Product.fromJson(res);
        // print(product!.data![0].id);
        // print(productItem[0]["name"]);
        // update();
      } else {
        change(productItem.value, status: RxStatus.error());
        isLoading = true;
        // update();
      }
    } catch (e) {
      change(productItem.value, status: RxStatus.error(e.toString()));
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

  List<ShowItem> showProduct = [];
  ///////////////////////show single product//////////////////////
  Future showProducst(id) async {
    try {
      isLoading = true;
      var res = await Productdata().showSingleProduct(id);
      var pro = res["data"] as List;
      if (res["status"] == 200) {
        isLoading = false;
        showProduct = pro.map((e) => ShowItem.fromJson(e)).toList();
        print(showProduct.length);
        // print(showProduct[].id);

        update();
      } else {
        isLoading = true;
        update();
      }
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  /////////////////////delete product////////////////////
  deleteProducts(id) async {
    try {
      isLoading = true;
      print("Id:$id");
      var res = await Productdata().deleteProduct(id: id);
      if (res["status"] == 200) {
        getProducts();
        print(res);
        update();
      } else {}
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  var swittch = false.obs;
  var featured = false.obs;
  changSwitch(value) {
    if (value == 1) {
      swittch.value = true;
    } else {
      swittch.value = false;
    }
  }

  changeFeaturedswitch(value) {
    if (value == 1) {
      featured.value = true;
    } else {
      featured.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
