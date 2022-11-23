import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/home_screen/home_screen_view.dart';
import 'package:sboba_app_client/module/onBoarding/onboarding_screen.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';

import 'package:sizer/sizer.dart';

import '../module/login_screen/login_screen_view.dart';
import '../module/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3500), () {
      if (CashHelper.getData("onBoard") != true) {
        Get.off(const OnBoardibgScreen());
      } else if (CashHelper.getData("token") == null) {
        Get.off(LoginScreen());
      } else if (CashHelper.getData("token") != null) {
        print(CashHelper.getData("token"));
        Get.off(HomeScreen());
      } else if (CashHelper.getData("onBoard") == true &&
          CashHelper.getData("token") != null) {
        Get.off(HomeScreen());
      } else if (CashHelper.getData("onBoard") == true ||
          CashHelper.getData("token") != null) {
        print(CashHelper.getData("token"));
        Get.off(LoginScreen());
      }
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGreen,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Image(
              height: 20.h,
              width: double.infinity,
              image: const ExactAssetImage("assets/1.png"),
            ),
          ),
        ),
      ),
    );
  }
}
