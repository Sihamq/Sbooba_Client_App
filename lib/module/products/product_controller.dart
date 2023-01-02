import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile;
//import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sboba_app_client/data/data_source/product_data/productData.dart';
import 'package:sboba_app_client/data/models/cateogry.dart';
import 'package:sboba_app_client/data/models/show_product.dart';
import 'package:sboba_app_client/module/products/product_binding.dart';
import 'package:sboba_app_client/module/shared/component/awesome_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:dio/src/multipart_file.dart';
//package:intl/src/intl/date_format.dart

import '../../data/models/get_product_model.dart';
import '../home_screen/home_screen_view.dart';

class ProductController extends GetxController
    with StateMixin<List<GetProductItem>> {
  ////////////////////////////////variables/////////////////////////
  List<XFile> imageFileList = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ImagePicker imagePicker = ImagePicker();
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  GetProduct? product;
  var productItem = <GetProductItem>[].obs;
  var getProductItem = GetProductItem().obs;
//  Product? products;
  // var productItems = <ProductItem>[].obs;
  List<CateogryItems> productCateogry = [];
  Cateogries? category;
  var dateController = DateRangePickerController().obs;
  var startDate, endDate;
  var productNameArabicController = TextEditingController();
  var productNameEnglishController = TextEditingController();
  var productDescriptionArabicController = TextEditingController();
  var productDescriptionEnglishController = TextEditingController();

  var selectCateogController = TextEditingController();
  var unitPriceController = TextEditingController();
  var unitPurchesController = TextEditingController();
  var miniProController = TextEditingController();
  var productTagController = TextEditingController();
  var productCaloriesController = TextEditingController();
  var productAvialbleController = TextEditingController();
  var productDiscountController = TextEditingController();
  ///////////////////////////////////rdit varibles///////////
//var startDate, endDate;
  var editProductNameArabicController = TextEditingController();
  var editProductNameEnglishController = TextEditingController();
  var editProductDescriptionArabicController = TextEditingController();
  var editProductDescriptionEnglishController = TextEditingController();

  var editSelectCateogController = TextEditingController();
  var editUnitPriceController = TextEditingController();
  var editUnitPurchesController = TextEditingController();
  var editMiniProController = TextEditingController();
  var editProductTagController = TextEditingController();
  var editProductCaloriesController = TextEditingController();
  var editProductAvialbleController = TextEditingController();
  var editProductDiscountController = TextEditingController();
  bool swittch = false;
  int? published;
  bool featured = false;
  int? feature;
  bool isLoading = false;
  List<ShowItem> showProduct = [];
  List<CateogryItems> discountTypeList = [
    CateogryItems(name: "c1".tr, id: 1),
    CateogryItems(name: "c2".tr, id: 2),
  ].obs;

  ///////////////////////////////////////methods//////////////////////////////////////
  void onInit() {
    getCateogries();
    // getProducts();
    getProductsByCateogrries(0);

    final DateTime today = DateTime.utc(0, 0, 0);
    startDate = "00-00-00".obs;
    endDate = "00-00-00".obs;
    dateController.value.selectedRange;
    // =
    // PickerDateRange(today, today.add(Duration(days: 3)));
    super.onInit();
  }

  String? img;
  var editSelectettedId;
  initData(ShowItem item) {
    editProductNameArabicController.text = item.name!.ar!;
    editProductNameEnglishController.text = item.name!.en!;
    editProductCaloriesController.text = item.calories.toString();
    editMiniProController.text = item.minQty.toString();
    editProductDescriptionArabicController.text = item.descriptionName!.ar!;
    editProductDescriptionEnglishController.text = item.descriptionName!.en!;
    editProductTagController.text = item.tags!;
    editUnitPriceController.text = item.unitPrice.toString();
    editUnitPurchesController.text = item.purchasePrice.toString();
    editProductAvialbleController.text = item.minQty.toString();
    editProductDiscountController.text = item.discount!.discount.toString();
    cat_id = item.categoryId;
    catSelect = item.cateogryName;
    img = item.image;
    disSelected.value = item.discount!.discountType!;
    if (disSelected == "1") {
      dis_id.value = 1;
      disSelected.value = "خصم بالنسبة";
    } else {
      dis_id.value = 2;
      disSelected.value = "خصم بالمبلغ";
    }
    feature = item.featured;
    published = item.published;
    startDate.value = DateFormat("yyyy-MM-dd")
        .format(item.discount!.discountEndDate!)
        .toString();
    endDate.value = DateFormat("yyyy-MM-dd")
        .format(item.discount!.discountEndDate!)
        .toString();
    //cat_id = item.categoryId;
    if (published == 1) {
      swittch = true;
    } else {
      swittch = false;
    }
    if (feature == 1) {
      featured = true;
    } else {
      featured = false;
    }
  }

  final picker = ImagePicker();
  var pickedFile;
  File? imagee;
  Future getImageBloc(ImageSource src) async {
    pickedFile = await picker.pickImage(source: src, imageQuality: 50);
    if (pickedFile != null) {
      imagee = File(pickedFile.path);
      update();
      print("image selected");
    } else {
      print("no image selected");
    }
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    print(productTagController.text);
    startDate.value =
        DateFormat("yyyy-MM-dd").format(args.value.startDate).toString();
    endDate.value = DateFormat("yyyy-MM-dd")
        .format(args.value.endDate ?? args.value.startDate)
        .toString();
    update();
  }

  var selected = 0.obs;
  getSelected(x) {
    selected.value = x;
    update();
  }

  ////////////////Get Products////////////////////////////////////////////
  Future getProducts() async {
    try {
      productItem.value = [];
      change(productItem.value, status: RxStatus.loading());
      isLoading = true;
      var res = await Productdata().getProduct();
      var pro = res["data"] as List;
      if (res["status"] == 200) {
        isLoading = false;
        productItem.value = pro.map((e) => GetProductItem.fromJson(e)).toList();
        change(productItem.value, status: RxStatus.success());
        print(productItem.length);
        if (productItem.isEmpty) {
          change(productItem.value, status: RxStatus.empty());
        }
        product = GetProduct.fromJson(res);
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

  Future getProductsByCateogrries(id) async {
    try {
      // productItem.value = [];
      change(productItem.value, status: RxStatus.loading());
      isLoading = true;
      var res = await Productdata().getProductByCateogry(id);
      var pro = res["data"] as List;
      if (res["status"] == 200) {
        isLoading = false;
        productItem.value = pro.map((e) => GetProductItem.fromJson(e)).toList();
        change(productItem.value, status: RxStatus.success());
        print(productItem.length);
        if (productItem.isEmpty) {
          change(productItem.value, status: RxStatus.empty());
        }
        product = GetProduct.fromJson(res);
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

  var deleteImage = [];
  void deleteImages(String image) {
    deleteImage.add(image);
    print("the delete image$deleteImage");
    update();
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
          const SnackBar(
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

  ///////////////////get Cateogry///////////////////////
  Future getCateogries() async {
    try {
      var res = await Productdata().getCateogryProduct();
      var cat = res["data"] as List;
      print(res);
      if (res["status"] == 200) {
        productCateogry = cat.map((e) => CateogryItems.fromMap(e)).toList();
        category = Cateogries.fromMap(res);
        print(category!.data![5].name);
        print("list ${productCateogry[2].name}");
        print("cateogryyyyy");
        // print(productCateogry.length);
        update();
      } else {
        print("no correct");
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

  //////////////////////////////////store product////////////////////////
  Future storeProduct() async {
    List y = [];
    for (var x in imageFileList) {
      y.add(MultipartFile.fromFileSync(x.path));
    }
    if (imagee == null) {
      CustomeAwesomeDialog().AwesomeDialogHeader(
          DialogType: DialogType.warning,
          context: Get.context,
          describe: "",
          mainTitle: "should".tr,
          subTitle: "failed".tr,
          btOnpressed: () => {
                //Navigator.pop(Get.context!)
              });
    } else {
      if (formKey.currentState!.validate()) {
        try {
          isLoading = true;
          var res = await Productdata().addNewProduct(
              name_ar: productNameArabicController.text,
              name_en: productNameEnglishController.text,
              description_ar: productDescriptionArabicController.text,
              description_en: productDescriptionEnglishController.text,
              category_id: cat_id,
              purchase_price: unitPurchesController.text,
              cash_on_delivery: 1,
              min_qty: 1,
              approved: 1,
              calories: productCaloriesController.text,
              featured: feature,
              published: published,
              discount: productDiscountController.text,
              current_stock: 1,
              discount_end_date:
                  endDate.value == "00-00-00" ? null : endDate.value,
              discount_start_date:
                  startDate.value == "00-00-00" ? null : startDate.value,
              discount_type: dis_id.value == 0 ? null : dis_id.value,
              low_stock_quantity: 1,
              stock_visibility_state: 1,
              tags: "food",
              unit_price: unitPriceController.text,
              todays_deal: 1,
              unit: 1,
              tax: 1,
              meta_description: "test",
              meta_title: "test",
              slug: "test",
              attachmentable: y,
              image: MultipartFile.fromFileSync(imagee!.path));
          if (res["status"] == 200) {
            isLoading = false;
            print(res["message"]);
            CustomeAwesomeDialog().AwesomeDialogHeader(
                DialogType: DialogType.success,
                context: Get.context,
                describe: "",
                mainTitle: "congra".tr,
                subTitle: "youhave".tr,
                btOnpressed: () => {
                      imagee == null,
                      imageFileList = [],
                      Get.offAll(HomeScreen(), binding: ProductBinding())
                    });
          } else {
            isLoading = false;
            CustomeAwesomeDialog().AwesomeDialogHeader(
                DialogType: DialogType.error,
                context: Get.context,
                describe: "",
                mainTitle: "oops".tr,
                subTitle: "failed".tr,
                btOnpressed: () => {
                      //Navigator.pop(Get.context!)
                    }
                //Get.offAll(HomeScreen(), binding: ProductBinding()

                );

            print("something is error in element");
          }
        } catch (e) {
          isLoading = false;
          print("something error  in error product${e.toString()}");
        }
      }
    }
  }

  ///////////////////////////////edit product/////////////////////////////
  Future editProducts({id}) async {
    try {
      //print("Name of${editProductNameArabicController.text}");
      isLoading = true;
      List y = [];

      for (var x in imageFileList) {
        y.add(MultipartFile.fromFileSync(x.path));
      }

      // print("Name of${editProductNameArabicController.text}");
      var res = await Productdata().editProduct(
          id: id,
          name_ar: editProductNameArabicController.text,
          name_en: editProductNameEnglishController.text,
          description_ar: editProductDescriptionArabicController.text,
          description_en: editProductDescriptionEnglishController.text,
          category_id: cat_id,
          purchase_price: editUnitPurchesController.text,
          cash_on_delivery: 1,
          min_qty: 1,
          approved: 1,
          calories: editProductCaloriesController.text,
          featured: feature,
          published: published,
          discount: editProductDiscountController.text == ""
              ? null
              : editProductDiscountController.text,
          current_stock: 1,
          discount_end_date: // "2022-09-30",
              endDate.value,

          //"2022-09-30", //endDate.value,
          discount_start_date: //"2022-09-30",
              startDate.value,

          //"2022-09-30", //startDate.value,
          discount_type: dis_id,
          low_stock_quantity: 1,
          stock_visibility_state: 1,
          tags: "food",
          unit_price: editUnitPriceController.text,
          todays_deal: 1,
          unit: 1,
          tax: 1,
          meta_description: "test",
          meta_title: "test",
          slug: "test",
          attachment_delete: deleteImage,
          attachments: y.isEmpty ? null : y,
          image:
              imagee == null ? null : MultipartFile.fromFileSync(imagee!.path));
      if (res["status"] == 200) {
        isLoading = false;
        print(res["message"]);
        print("Name of${editProductNameArabicController.text}");
        CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: Get.context,
            describe: "",
            mainTitle: "congra".tr,
            subTitle: "yupdate".tr,
            btOnpressed: () =>
                {Get.offAll(HomeScreen(), binding: ProductBinding())});
      } else {
        isLoading = false;
        CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.error,
            context: Get.context,
            describe: "",
            mainTitle: "oops".tr,
            subTitle: "failed".tr,
            btOnpressed: () => {
                  //Navigator.pop(Get.context!)
                }
            //Get.offAll(HomeScreen(), binding: ProductBinding()

            );

        print("something is error in element");
      }
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  var catSelect;
  var disSelected = "".obs;
  var cat_id;
  var dis_id = 0.obs;
  void changeSelectCategory(val) {
    catSelect = val.name;
    cat_id = val.id;
    print(cat_id);
    update();
  }

  void changeSelectDiscount(val) {
    disSelected.value = val.name;
    dis_id.value = val.id;
    print(dis_id.value);
    update();
  }

  changSwitch(value) {
    swittch = value;
    if (swittch == true) {
      published = 1;
      update();
    } else {
      published = 0;
      update();
    }
  }

  changeFeaturedswitch(value) {
    featured = value;
    if (featured == true) {
      feature = 1;
      update();
    } else {
      feature = 0;
      update();
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
