import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sboba_app_client/data/models/coupons.dart';
import 'package:sboba_app_client/module/coupons/coupons_binding.dart';
import 'package:sboba_app_client/module/coupons/coupons_view.dart';

import '../../data/data_source/coupon_data/coupon_data.dart';
import '../shared/component/awesome_dialog.dart';

class CouponsController extends GetxController
    with StateMixin<List<CouponsItems>> {
  var couponCode = TextEditingController();
  //var
  var disountType = TextEditingController();
  var discount = TextEditingController();
  //////////////////////edit controller for text////////
  var editCouponCode = TextEditingController();

  var editDisountType = TextEditingController();
  var editDiscount = TextEditingController();
  var couponItem = <CouponsItems>[].obs;
  bool isLoading = false;
  List<String> discountTypeList = ["50 %", "20%"];
  var delete;
  void onInit() {
    getCoupons();
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
    editDisountType.text = item.couponType.toString();
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
    try {
      var res = await CouponData().storeCoupon(
          couponType: "1",
          couponCode: couponCode.text,
          discountType: disountType.text,
          discount: discount.text,
          fromDate: "2022-10-1",
          toDate: "2022-12-1",
          status: "1",
          productName: "1");
      if (res["status"] == 200) {
        CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: Get.context,
            describe: "",
            mainTitle: "congra".tr,
            subTitle: "creatc".tr,
            btOnpressed: () => {getCoupons().then((value) => Get.back())});
      } else {}
    } catch (e) {}
  }

  updateCoupon() async {
    try {
      var res = await CouponData().storeCoupon(
          couponType: "1",
          couponCode: editCouponCode.text,
          discountType: editDisountType.text,
          discount: editDiscount.text,
          fromDate: "2022-10-1",
          toDate: "2022-12-1",
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
      } else {}
    } catch (e) {}
  }
}
