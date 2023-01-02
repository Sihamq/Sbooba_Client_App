import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sboba_app_client/module/verification/email_verification/email_verification_controller.dart';
import 'package:sboba_app_client/module/verification/email_verification/widget/arrow_container.dart';

import 'package:sizer/sizer.dart';

import '../../shared/component/custom_text_field.dart';
import '../../shared/component/green_button.dart';
import 'check_screen.dart';

class EmailVerification extends StatelessWidget {
  var nameController = TextEditingController();
  EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // actions: [
        //   ArrowContainer(),
        // ],
      ),
      // appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
              top: 18.h,
            ),
            child: GetBuilder<EmailVerificationController>(
              init: EmailVerificationController(),
              builder: (controller) => Form(
                key: controller.formKey,
                child: Column(children: [
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
                    child: Text("please enter email".tr,
                        style: TextStyle(fontSize: 12.sp)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: MyTextField(
                      controller: controller.emailVerifyController,
                      obcure: false,
                      label: "Enter your Email".tr,
                      prefix: Icons.email,
                    ),
                  ),
                  BlueButton(
                      onpress: () {
                        controller.forgetePass(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const CheckScreen()),
                        // );
                      },
                      title: Text(
                        "Send Code".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      hight: 7.h,
                      width: 100.w),
                ]),
              ),
            )),
      ),
    );
  }
}
