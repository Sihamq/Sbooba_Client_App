import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sboba_app_client/data/data_source/auth/change_password.dart';
import 'package:sboba_app_client/data/data_source/auth/forgetPass.dart';

import '../../home_screen/home_screen_view.dart';
import '../../products/product_binding.dart';
import '../../shared/component/awesome_dialog.dart';

class ChangePassController extends GetxController {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var emailVerifyController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ChangePass(context) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        var res = await PasswordData().ChangePassword(
            oldPassword: oldPasswordController.text,
            newPassword: newPasswordController.text,
            confirmPassword: confirmPasswordController.text);
        if (res["status"] == 200) {
          isLoading = false;

          CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: context,
            describe: "",
            mainTitle: "congra".tr,
            subTitle: "تم تغيير كلمة المرور بنجاح",
            btOnpressed: () =>
                Get.offAll(HomeScreen(), binding: ProductBinding()),
          );
        } else if (res["status"] == 500) {
          isLoading = false;
          CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: context,
            describe: "",
            mainTitle: "حدث خطأ",
            subTitle: "لم يتم تغيير كلمة المرور",
            btOnpressed: () =>
                Get.offAll(HomeScreen(), binding: ProductBinding()),
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
   }
