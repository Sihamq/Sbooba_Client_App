//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/Profile/profile_view.dart';
import 'package:sboba_app_client/module/coupons/coupons_view.dart';
import 'package:sboba_app_client/module/notification/notification_view.dart';
import 'package:sboba_app_client/module/order/order_screen_view.dart';
import 'package:sboba_app_client/module/products/product_view.dart';

import '../my_colors.dart';

class HomeController extends GetxController {
  var list = [
    OrderView(),
    ProductView(),
    NotificationView(),
    CouponsView(),
    ProfileView(),
  ];
  var label = [
    "order".tr,
    "Products".tr,
    "Notification".tr,
    "Coupons".tr,
    "Profile".tr
  ];
  List<String> icon = [
    "assets/tracking.png",
    "assets/product.png",
    "assets/not.png",
    "assets/vou.png",
    "assets/use.png",
  ];
  int currentIndex = 0;
  TabController? tabController;
  @override
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

  changCurrentIndex(index) {
    currentIndex = index;
    update();
  }
}
