import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sboba_app_client/data/models/cateogry.dart';
import 'package:sboba_app_client/data/models/coupons.dart';
import 'package:sboba_app_client/data/models/list_product.dart';
import 'package:sboba_app_client/module/coupons/coupons_binding.dart';
import 'package:sboba_app_client/module/coupons/coupons_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../data/data_source/coupon_data/coupon_data.dart';
import '../shared/component/awesome_dialog.dart';
import 'package:intl/intl.dart';

class CouponsController extends GetxController
    with StateMixin<List<CouponsItems>> {
  var couponCode = TextEditingController();
  var couponType = TextEditingController();
  //var
  var disountType = TextEditingController();
  var discount = TextEditingController();
  //////////////////////edit controller for text////////
  var editCouponCode = TextEditingController();

  var editcouponType = TextEditingController();

  var editDisountType = TextEditingController();
  var editDiscount = TextEditingController();

  var couponItem = <CouponsItems>[].obs;
  bool isLoading = false;
  List<CateogryItems> discountTypeList = [
    CateogryItems(name: "خصم بالنسبة", id: 1),
    CateogryItems(name: "خصم بالمبلغ", id: 2),
  ].obs;
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  var delete;
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  var startDate, endDate;

  var dateController = DateRangePickerController().obs;
  List<CateogryItems> couponsItem = [
    CateogryItems(name: "c1".tr, id: 0),
    CateogryItems(name: "c2".tr, id: 1)
  ].obs;
  var radioItem = "".obs;
  var radioId = 0.obs;
  //   id = data.index;
  var catSelect = "".obs;
  var cat_id = 0.obs;
  var discountSelect = "".obs;
  var discountId = 0.obs;
  void changeRadioButton(val) {
    radioItem.value = val.name;
    radioId.value = val.id;
  }

  var idies = [].obs;
  void changeSelectDiscount(val) {
    discountSelect.value = val.name;

    discountId.value = val.id;
    idies.value.add(discountId);

    update();
  }

  void changeSelectCategory(val) {
    catSelect.value = val.name;
    cat_id.value = val.id;
    print(cat_id);
    update();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    startDate.value =
        DateFormat("yyyy-MM-dd").format(args.value.startDate).toString();
    endDate.value = DateFormat("yyyy-MM-dd")
        .format(args.value.endDate ?? args.value.startDate)
        .toString();
    update();
  }

  void onInit() {
    getCoupons();
    final DateTime today = DateTime.utc(0, 0, 0);
    startDate = "00-00-00".obs;
    endDate = "00-00-00".obs;
    dateController.value.selectedRange;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  initData(CouponsItems item) {
    editCouponCode.text = item.couponCode!;
    editDiscount.text = item.discount.toString();
    editDisountType.text = item.discountType.toString();
    editcouponType.text = item.couponType.toString();
    cat_id.value = item.couponType!;
    discountId.value = item.discountType!;
    if (discountId == 1) {
      // dis_id.value = 1;
      discountSelect.value = "خصم بالنسبة";
    } else {
      // dis_id.value = 2;
      discountSelect.value = "خصم بالمبلغ";
    }
    startDate.value =
        DateFormat("yyyy-MM-dd").format(item.fromDate!).toString();
    endDate.value = DateFormat("yyyy-MM-dd").format(item.toDate!).toString();
   // idies.add(item.)

    // cat_id.value = item.couponType!;
  }

  /////////////fetching coupon//////////////////////
  Future getCoupons() async {
    try {
      change(couponItem.value, status: RxStatus.loading());
      isLoading = true;
      var res = await CouponData().getCoupons();
      if (res["status"] == 200) {
        isLoading = false;
        var coupons = res["data"] as List;

        couponItem.value =
            coupons.map((e) => CouponsItems.fromJson(e)).toList();
        change(couponItem.value, status: RxStatus.success());
        print(couponItem);
        if (couponItem.value.isEmpty) {
          change(couponItem.value, status: RxStatus.empty());
        }
        update();
      } else {
        isLoading = true;
        change(couponItem.value, status: RxStatus.empty());
      }
    } catch (e) {
      print("something error ${e.toString()}");
      change(couponItem.value, status: RxStatus.empty());
    }
  }

  deleteCoupons(id) async {
    try {
      isLoading = true;
      print("Id:$id");
      var res = await CouponData().deleteCoupon(id: id);
      if (res["status"] == 200) {
        getCoupons();
        // isLoading = false;
        // print(res[""]);
        //print(couponItem);
        print(res);
        // update();
      } else {
        // isLoading = true;
      }
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  int slected = 0;
  selectIndex(index) {
    slected = index;
    update();
  }

  createCoupon() async {
    if (catSelect.isEmpty && discountSelect.isEmpty) {
      CustomeAwesomeDialog().AwesomeDialogHeader(
          DialogType: DialogType.warning,
          context: Get.context,
          describe: "",
          mainTitle: "",
          subTitle: "choosse".tr,
          btOnpressed: () => {});
    } else {
      if (formKey1.currentState!.validate()) {
        try {
          var res = await CouponData().storeCoupon(
              couponType: 1,
              couponCode: couponCode.text,
              discountType: discountId,
              discount: discount.text,
              fromDate: startDate.value,
              toDate: endDate.value,
              status: "1",
              productName: idies);
          if (res["status"] == 200) {
            CustomeAwesomeDialog().AwesomeDialogHeader(
                DialogType: DialogType.success,
                context: Get.context,
                describe: "",
                mainTitle: "congra".tr,
                subTitle: "creatc".tr,
                btOnpressed: () => {
                      couponCode.clear(),
                      catSelect.value = "",
                      discountSelect.value = "",
                      discount.clear(),
                      getCoupons().then((value) => Get.back())
                    });
          } else {
            CustomeAwesomeDialog().AwesomeDialogHeader(
                DialogType: DialogType.success,
                context: Get.context,
                describe: "",
                mainTitle: "error".tr,
                subTitle: "لم يتم اضافة كوبون جديد".tr,
                btOnpressed: () => {
                      couponCode.clear(),
                      catSelect.value = "",
                      discountSelect.value = "",
                      discount.clear(),
                      getCoupons().then((value) => Get.back())
                    });
          }
        } catch (e) {
          print("errors is ${e.toString()}");
        }
      }
    }
  }

  var ProdctList = [].obs;
  Future getProductList() async {
    try {
      isLoading = true;
      var res = await CouponData().getProduct();
      if (res["status"] == 200) {
        isLoading = false;
        var coupons = res["data"] as List;

        ProdctList.value =
            coupons.map((e) => CouponProductItem.fromJson(e)).toList();

        // print(couponItem);

        update();
      } else {
        isLoading = true;
        //  change(couponItem.value, status: RxStatus.empty());
      }
    } catch (e) {
      print("something error ${e.toString()}");
      change(couponItem.value, status: RxStatus.empty());
    }
  }

  updateCoupon({id}) async {
    if (catSelect.value.isEmpty && discountSelect.value.isEmpty) {
      CustomeAwesomeDialog().AwesomeDialogHeader(
          DialogType: DialogType.warning,
          context: Get.context,
          describe: "",
          mainTitle: "",
          subTitle: "choosse".tr,
          btOnpressed: () => {});
    } else {
      if (formKey2.currentState!.validate()) {
        try {
          var res = await CouponData().editCoupon(
              id: id,
              couponType: cat_id,
              couponCode: editCouponCode.text,
              discountType: discount,
              discount: editDiscount.text,
              fromDate: startDate.value,
              toDate: endDate.value,
              status: "1",
              productName: "1");
          if (res["status"] == 200) {
            CustomeAwesomeDialog().AwesomeDialogHeader(
                DialogType: DialogType.success,
                context: Get.context,
                describe: "",
                mainTitle: "congra".tr,
                subTitle: "yupdate".tr,
                btOnpressed: () => {getCoupons().then((value) => Get.back())});
          } else {
            CustomeAwesomeDialog().AwesomeDialogHeader(
                DialogType: DialogType.success,
                context: Get.context,
                describe: "",
                mainTitle: "error".tr,
                subTitle: "لم يتم تحديث الكوبون".tr,
                btOnpressed: () => {});
          }
        } catch (e) {
          print("Something is error  ${e.toString()}");
        }
      }
    }
  }
}
