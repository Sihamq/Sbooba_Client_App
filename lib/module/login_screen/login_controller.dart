import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/data_source/auth/login_data.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:sboba_app_client/module/home_screen/home_screen_view.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/product_binding.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/module/shared/component/awesome_dialog.dart';
import 'package:sboba_app_client/module/shared/component/snack_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LoginController extends GetxController {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isshowpassword = true;
  var isLoading = false;
  IconData? iconVisiblity = Icons.visibility_off;
  showPassword() {
    isshowpassword = !isshowpassword;
    // isshowpassword = isshowpassword == true ? false : true;

    iconVisiblity = isshowpassword ? Icons.visibility_off : Icons.visibility;
    update();
  }

  @override
  void onInit() {
    showPassword();
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

  ///////////////login method///////////////
  login(context) async {
    if (formKey.currentState!.validate()) {
      try {
        print(nameController.text);
        print(passwordController.text);
        isLoading = true;
        var res = await LoginData().postData(
            email: nameController.text, password: passwordController.text);
        if (res["status"] == 200) {
          isLoading = false;
          String token = res["data"]["token"];
          print(token.toString());
          CashHelper.putData("token", token);
          CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: context,
            describe: "",
            mainTitle: "congra".tr,
            subTitle: "Sucessfullylogin".tr,
            btOnpressed: () =>
                Get.offAll(HomeScreen(), binding: ProductBinding()),
          );
        } else if (res["status"] == 500) {
          isLoading = false;
          if (res["message"] == "msg_password_mismatch") {
            showSnakBarMessage(msg: "notcorrect".tr, color: Colors.red[900]);
          }
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
