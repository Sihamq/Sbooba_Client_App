import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

showSnakBarMessage({required String msg, required color}) {
  Get.showSnackbar(GetBar(
    icon: Icon(
      color == Colors.green[900]
          ? Icons.check_circle_outline
          : Icons.error_outline_outlined,
      color: Colors.white,
    ),
    shouldIconPulse: true,
    title: "Warning".tr,
    snackPosition: SnackPosition.BOTTOM,
    barBlur: .5,
    borderRadius: 5.0,
    padding: EdgeInsets.only(left: 1.h, right: 1.h),
    messageText: Text(
      msg,
      style: TextStyle(
          color: myWhite, fontWeight: FontWeight.bold, fontSize: 15.sp),
    ),
    overlayBlur: 5.0,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(seconds: 5),
    backgroundColor: color,
  ));
}
