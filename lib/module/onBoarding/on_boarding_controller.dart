import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/onBoarding/onBoardingModel.dart';

class OnBaordingController extends GetxController {
  List<OnBoardingModel> images = [
    OnBoardingModel(
        image: "assets/o3.png", title: "passi".tr, body: "passii".tr),
    OnBoardingModel(image: "assets/o2.png", title: "del".tr, body: "allp".tr),
    OnBoardingModel(
        image: "assets/o1.png", title: "spread".tr, body: "spreadd".tr),
  ];
  bool isLast = false;
  var boardController = PageController();
  onChange(value) {
    if (value == images.length - 1) {
      isLast = true;
      update();
    } else {
      isLast = false;
      update();
    }
  }
}
