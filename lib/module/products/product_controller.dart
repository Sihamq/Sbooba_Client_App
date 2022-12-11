import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sboba_app_client/data/data_source/product_data/productData.dart';
import 'package:sboba_app_client/data/models/cateogry.dart';
import 'package:sboba_app_client/data/models/product_model.dart';
import 'package:sboba_app_client/data/models/show_product.dart';
import 'package:sboba_app_client/module/products/product_binding.dart';
import 'package:sboba_app_client/module/shared/component/awesome_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../home_screen/home_screen_view.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductItem>> {
  ////////////////////////////////variables/////////////////////////
  List<XFile> imageFileList = [];
  final ImagePicker imagePicker = ImagePicker();
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  Product? product;
  var productItem = <ProductItem>[].obs;
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
  ///////////////////////////////////////methods//////////////////////////////////////
  void onInit() {
    getCateogries();
    getProducts();

    final DateTime today = DateTime.utc(0, 0, 0);
    startDate = "00-00-00".obs;
    endDate = "00-00-00".obs;
    dateController.value.selectedRange;
    // =
    // PickerDateRange(today, today.add(Duration(days: 3)));
    super.onInit();
  }

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
    feature = item.featured;
    published = item.published;
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

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    print(productTagController.text);
    startDate.value =
        DateFormat('dd, MMMM yyyy').format(args.value.startDate).toString();
    endDate.value = DateFormat('dd, MMMM yyyy')
        .format(args.value.endDate ?? args.value.startDate)
        .toString();
    update();
  }

  int? selected = 0;
  getSelected(x) {
    selected = x;
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
    try {
      var res = await Productdata().addNewProduct(
          name_ar: productNameEnglishController.text,
          name_en: productNameArabicController.text,
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
          discount_end_date: endDate.value,
          discount_start_date: startDate.value,
          discount_type: 1,
          low_stock_quantity: 1,
          stock_visibility_state: 1,
          tags: "food",
          unit_price: unitPriceController.text,
          todays_deal: 1,
          unit: 1,
          tax: 0,
          meta_description: "test",
          meta_title: "test",
          slug: "test");
      if (res["status"] == 200) {
        print(res["message"]);
        CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: Get.context,
            describe: "",
            mainTitle: "congra".tr,
            subTitle: "youhave".tr,
            btOnpressed: () =>
                {Get.offAll(HomeScreen(), binding: ProductBinding())});
      } else {
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

  ///////////////////////////////edit product/////////////////////////////
  Future editProducts({id}) async {
    try {
      //print("Name of${editProductNameArabicController.text}");
      if (cat_id == null) {
        CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: Get.context,
            describe: "",
            mainTitle: "".tr,
            subTitle: "enter".tr,
            btOnpressed: () => {});
      } else {
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
            discount: editProductDiscountController.text,
            current_stock: 1,
            discount_end_date: endDate.value,
            discount_start_date: startDate.value,
            discount_type: 1,
            low_stock_quantity: 1,
            stock_visibility_state: 1,
            tags: "food",
            unit_price: editUnitPriceController.text,
            todays_deal: 1,
            unit: 1,
            tax: 0,
            meta_description: "test",
            meta_title: "test",
            slug: "test");
        if (res["status"] == 200) {
          print(res["message"]);
          print("Name of${editProductNameArabicController.text}");
          CustomeAwesomeDialog().AwesomeDialogHeader(
              DialogType: DialogType.success,
              context: Get.context,
              describe: "",
              mainTitle: "congra".tr,
              subTitle: "yupdate".tr,
              btOnpressed: () => {
                    // Get.offAll(HomeScreen(), binding: ProductBinding())
                  });
        } else {
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
      }
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  var catSelect;
  var cat_id;
  void changeSelectCategory(val) {
    catSelect = val.name;
    cat_id = val.id;
    print(cat_id);
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
