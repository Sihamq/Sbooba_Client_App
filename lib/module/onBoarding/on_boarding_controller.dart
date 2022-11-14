import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/onBoarding/onBoardingModel.dart';

class OnBaordingController extends GetxController {
  List<OnBoardingModel> images = [
    OnBoardingModel(
        image: "assets/o1.png",
        title: "Title one",
        body: "Description step one"),
    OnBoardingModel(
        image: "assets/o2.png",
        title: "Title two",
        body: "Description step two"),
    OnBoardingModel(
        image: "assets/o3.png",
        title: "Title three",
        body: "Description step three"),
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
