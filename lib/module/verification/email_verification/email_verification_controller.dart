import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/data_source/auth/forgetPass.dart';
import 'package:sboba_app_client/module/shared/component/awesome_dialog.dart';

class EmailVerificationController extends GetxController {
  var emailVerifyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

          CustomeAwesomeDialog().AwesomeDialogHeader(
              DialogType: DialogType.success,
              context: context,
              describe: "",
              mainTitle: "congra".tr,
              subTitle: "تم تغيير كلمة المرور بنجاح",
              btOnpressed: () => {}
              // Get.offAll(HomeScreen(), binding: ProductBinding()),
              );
        } else if (res["status"] == 500) {
          isLoading = false;
          CustomeAwesomeDialog().AwesomeDialogHeader(
              DialogType: DialogType.success,
              context: context,
              describe: "",
              mainTitle: "حدث خطأ",
              subTitle: "لم يتم تغيير كلمة المرور",
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
