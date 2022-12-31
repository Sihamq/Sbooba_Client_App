import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/verification/email_verification/email_verification_controller.dart';
import 'package:sboba_app_client/module/verification/email_verification/widget/arrow_container.dart';
import 'package:sboba_app_client/module/verification/email_verification/widget/pinCode.dart';

import 'package:sizer/sizer.dart';

import '../../shared/component/green_button.dart';
import '../change_password/change_password.dart';
import 'check_screen.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          InkWell(
              onTap: () {
                navigator!.pop();
              },
              child: ArrowContainer()),
        ],
      ),
      // appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
              top: 13.h,
            ),
            child: GetBuilder<EmailVerificationController>(
              init: EmailVerificationController(),
              builder: (controller) => Column(children: [
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Container(
                    child: const Image(image: AssetImage("assets/121.png")),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Text("Recover your Password".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp)),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child:
                      Text("WriteCode".tr, style: TextStyle(fontSize: 12.sp)),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: 2.h, bottom: 1.h, left: 7.w, right: 7.w),
                    child: CustomPinCode()),
                // BlueButton(
                //     onpress: () {
                //       Get.to(() => ChangePassword());
                //     },
                //     title: Text(
                //       "Next".tr,
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 15.sp),
                //     ),
                //     hight: 6.h,
                //     width: 100.w),
                const SizedBox(
                  height: 180,
                ),
              ]),
            )),
      ),
    );
  }
}
