import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sboba_app_client/module/verification/change_password/change_controller.dart';
import 'package:sboba_app_client/module/verification/email_verification/email_verification_controller.dart';

import 'package:sizer/sizer.dart';

import '../../shared/component/custom_text_field.dart';
import '../../shared/component/green_button.dart';
import '../email_verification/widget/arrow_container.dart';

class RestorePassword extends StatelessWidget {
  const RestorePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // InkWell(
          //     onTap: (() {
          //       navigator!.pop();
          //     }),
          //     child: ArrowContainer()),
        ],
      ),

      backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.white),
      body: GetBuilder<EmailVerificationController>(
        init: EmailVerificationController(),
        builder: (controller) => SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                top: 8.h,
              ),
              child: Form(
                key: controller.formKey1,
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Container(
                      child: const Image(image: AssetImage("assets/121.png")),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Text("Set a new Password".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Text("Set a new Password".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 4.h, bottom: 2.h, left: 2.h, right: 2.h),
                    child: MyTextField(
                      controller: controller.passwordController,
                      obcure: true,
                      label: "Enter your password".tr,
                      prefix: Icons.lock,
                      suffix: Icons.visibility,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 1.h, left: 2.h, right: 2.h),
                    child: MyTextField(
                      controller: controller.confiremController,
                      obcure: true,
                      label: "Confirmyourpassword".tr,
                      prefix: Icons.lock,
                      suffix: Icons.visibility,
                    ),
                  ),
                  BlueButton(
                      onpress: () {
                        controller.sendRestorePassword(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => CreateAccount()),
                        // );
                      },
                      title: Text(
                        "Save".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                      hight: 7.h,
                      width: 100.w),
                ]),
              )),
        ),
      ),
    );
    ;
  }
}
