import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CouponsController extends GetxController {
  var couponCode = TextEditingController();
  var disountType = TextEditingController();
  var discount = TextEditingController();

  void onInit() {
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

  int slected = 0;
  selectIndex(index) {
    slected = index;
    update();
  }
}
