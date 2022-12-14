import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sboba_app_client/lang/lang_controller.dart';
import 'package:sboba_app_client/module/login_screen/login_controller.dart';
import 'package:sboba_app_client/module/my_colors.dart';

import 'package:sizer/sizer.dart';

import '../create_profile_screen/create_profile_view.dart';
import '../shared/component/custom_text_field.dart';
import '../shared/component/green_button.dart';
import '../shared/function/validInput.dart';
import '../verification/email_verification/email_verification.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
        Padding(
          padding: EdgeInsets.all(1.h),
          child: InkWell(
              child: Icon(
                Icons.language,
                color: myOrange,
                size: 23.sp,
              ),
              onTap: () => Get.defaultDialog(
                  backgroundColor: myWhite,
                  buttonColor: myGreen,
                  title: "Language".tr,
                  titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                  content: Column(children: [
                    GetBuilder<LanguageController>(
                        init: LanguageController(),
                        builder: (controller) => Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      controller.changeLang("ar");
                                      navigator!.pop();
                                    },
                                    child: Text(
                                      "Arabic".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: myGreen),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      controller.changeLang("en");
                                      navigator!.pop();
                                    },
                                    child: Text(
                                      "English".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: myGreen),
                                    ))
                              ],
                            )),
                  ]))),
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
              top: 2.h,
            ),
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (controller) => Form(
                key: controller.formKey,
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: const Image(
                      image: AssetImage("assets/121.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Text("Welcome To Sboba".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.h),
                    child: MyTextField(
                      controller: controller.nameController,
                      obcure: false,
                      label: "Enter your Email".tr,
                      validate: ((p0) {
                        return validInput(p0!, 3, 40, "email");
                      }),
                      prefix: Icons.email,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 3.h, left: 3.h, right: 3.h),
                    child: MyTextField(
                      validate: ((p0) {
                        return validInput(p0!, 6, 12, "password");
                      }),
                      controller: controller.passwordController,
                      obcure: controller.isshowpassword,
                      label: "Enter your password".tr,
                      prefix: Icons.lock,
                      suffix: controller.iconVisiblity,
                      onTapIcon: () => controller.showPassword(),
                    ),
                  ),
                  Obx(
                    () => BlueButton(
                        onpress: () async {
                          FocusScope.of(context).unfocus();
                          await controller.login(context);
                        },
                        title: controller.isLoading == true
                            ? SpinKitDualRing(
                                size: 20.sp,
                                color: myOrange,
                              )
                            : Text(
                                "LOGIN".tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                        hight: 7.h,
                        width: 49.h),
                  ),
                  InkWell(
                    onTap: (() {
                      Get.to(EmailVerification());
                    }),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'forget'.tr,
                            style: TextStyle(color: myGreen, fontSize: 12.sp)),
                      ]),
                    ),
                  ),
                  //Spacer(),
                  SizedBox(
                    height: 17.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: InkWell(
                      onTap: () {
                        Get.to(CreateAccount());
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Dont have account".tr,
                              style: TextStyle(
                                  color: HexColor('#5D5E60'), fontSize: 12.sp)),
                          TextSpan(
                              text: "Create Acount".tr,
                              style: TextStyle(
                                  color: HexColor('#EF9B27'), fontSize: 12.sp))
                        ]),
                      ),
                    ),
                  )
                ]),
              ),
            )),
      ),
    );
  }
}
