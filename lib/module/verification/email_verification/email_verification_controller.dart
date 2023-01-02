import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/data_source/auth/forgetPass.dart';
import 'package:sboba_app_client/module/login_screen/login_binding.dart';
import 'package:sboba_app_client/module/login_screen/login_controller.dart';
import 'package:sboba_app_client/module/login_screen/login_screen_view.dart';
import 'package:sboba_app_client/module/shared/component/awesome_dialog.dart';
import 'package:sboba_app_client/module/verification/email_verification/restore_password.dart';

import 'check_screen.dart';

class EmailVerificationController extends GetxController {
  var emailVerifyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  var pinController = TextEditingController();
  var passwordController = TextEditingController();
  var confiremController = TextEditingController();
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
  }

  forgetePass(context) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        var res = await ForgetPassdData()
            .ForgetPassword(email: emailVerifyController.text);
        if (res["status"] == 200) {
          isLoading = false;
          Get.to(() => const CheckScreen());
        } else {
          isLoading = false;
          CustomeAwesomeDialog().AwesomeDialogHeader(
              DialogType: DialogType.error,
              context: context,
              describe: "",
              mainTitle: "error".tr,
              subTitle: "noreg".tr,
              btOnpressed: () => {}
              // Get.offAll(HomeScreen(), binding: ProductBinding()),
              );
        }

        update();
      } catch (e) {
        isLoading = false;
        print(e.toString());
        //print("email or password not correct");
      }
      update();
    }
  }

  sendOtpCode(context) async {
    if (formKey.currentState!.validate()) {
      print(emailVerifyController.text);
      try {
        isLoading = true;
        var res = await ForgetPassdData().OtpData(
            email: emailVerifyController.text, token: pinController.text);
        if (res["status"] == 200) {
          isLoading = false;

          Get.to(RestorePassword());
        } else if (res["status"] == false) {
          isLoading = false;
          CustomeAwesomeDialog().AwesomeDialogHeader(
              DialogType: DialogType.success,
              context: context,
              describe: "",
              mainTitle: "error".tr,
              subTitle: "verify".tr,
              btOnpressed: () => {}
              // Get.offAll(HomeScreen(), binding: ProductBinding()),
              );
        }

        update();
      } catch (e) {
        isLoading = false;
        print(e.toString());
        //print("email or password not correct");
      }
      update();
    }
  }

  sendRestorePassword(context) async {
    if (formKey1.currentState!.validate()) {
      try {
        isLoading = true;
        var res = await ForgetPassdData().restorePass(
            token: pinController.text,
            email: emailVerifyController.text,
            password: passwordController.text,
            confirmpassword: confiremController.text);
        if (res["status"] == 200) {
          isLoading = false;

          CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: context,
            describe: "",
            mainTitle: "congra".tr,
            subTitle: "change".tr,
            btOnpressed: () =>
                Get.offAll(LoginScreen(), binding: LoginBinding()),
          );
        } else {
          isLoading = false;
          CustomeAwesomeDialog().AwesomeDialogHeader(
              DialogType: DialogType.success,
              context: context,
              describe: "",
              mainTitle: "error".tr,
              subTitle: "nochange".tr,
              btOnpressed: () => {});
        }

        update();
      } catch (e) {
        isLoading = false;
        print(e.toString());
        //print("email or password not correct");
      }
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
