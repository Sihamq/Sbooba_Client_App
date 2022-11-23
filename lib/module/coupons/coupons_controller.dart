import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sboba_app_client/data/models/coupons.dart';

import '../../data/data_source/coupon_data/coupon_data.dart';

class CouponsController extends GetxController {
  var couponCode = TextEditingController();
  var disountType = TextEditingController();
  var discount = TextEditingController();
  var couponItem = <CouponsItems>[].obs;
  bool isLoading = false;
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

  /////////////fetching coupon//////////////////////
  getCoupons() async {
    try {
      isLoading = true;
      var res = await CouponData().getCoupons();
      if (res["status"] == 200) {
        isLoading = false;
        var coupons = res["data"] as List;

        couponItem.value =
            coupons.map((e) => CouponsItems.fromJson(e)).toList();
        print(couponItem);

        update();
      } else {
        isLoading = true;
      }
    } catch (e) {
      print("something error ${e.toString()}");
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
        update();
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
}
