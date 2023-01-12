//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/lang/lang_controller.dart';
import 'package:sboba_app_client/module/Profile/profile%20_screen.dart';

import 'package:sboba_app_client/module/coupons/coupons_view.dart';
import 'package:sboba_app_client/module/notification/notification_view.dart';
import 'package:sboba_app_client/module/order/order_screen_view.dart';
import 'package:sboba_app_client/module/products/product_view.dart';

import '../my_colors.dart';

class HomeController extends GetxController {
  LanguageController languageController = Get.put(LanguageController());
  var list = [
    OrderView(),
    const ProductView(),
    const NotificationView(),
    const CouponsView(),
    //ProfileView(),
    const ProfileScreen()
  ];
  var label = ["order", "Products", "Notification", "c", "Profile"].obs;
  List<String> icon = [
    "assets/tracking.png",
    "assets/product.png",
    "assets/not.png",
    "assets/vou.png",
    "assets/use.png",
  ];
  var currentIndex = 0.obs;
  TabController? tabController;
  @override
  void onInit() {
    // Get.put(LanguageController()).update();
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
    currentIndex.value = index;
    update();
  }
}
