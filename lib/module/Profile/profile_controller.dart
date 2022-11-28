import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/data_source/profile_data/profile_data.dart';
import 'package:sboba_app_client/data/models/product_model.dart';
import 'package:sboba_app_client/data/models/profile_model.dart';
import 'package:sboba_app_client/module/login_screen/login_binding.dart';
import 'package:sboba_app_client/module/login_screen/login_screen_view.dart';
import 'package:sboba_app_client/module/shared/component/awesome_dialog.dart';
import 'package:sboba_app_client/module/shared/component/snack_message.dart';

class ProfileController extends GetxController {
  var editName = TextEditingController();
  var editEmail = TextEditingController();
  var editPhone = TextEditingController();
  var editShopAdress = TextEditingController();
  var editCommerical = TextEditingController();
  var editShopName = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // bool isLoading = false;
  void onInit() {
    getProfileInformation();
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

  int slected = 0;
  selectIndex(index) {
    slected = index;
    update();
  }

  int? gender = 0;
  changeGender(value) {
    gender = value;
    update();
  }

  //////////////////////getProfile//////////////////////////
  Profile? profile;
  bool isLoading = false;
  getProfileInformation() async {
    try {
      isLoading = true;
      var res = await ProfileData().getProfile();
      if (res["status"] == 200) {
        profile = Profile.fromJson(res);
        print(profile!.data!.name);
        isLoading = false;
        update();
      } else {
        //isLoading = true;
        update();
      }
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  /////////////////////update profile////////////////////////////////
  updateProfileInformation(context) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        var res = await ProfileData().updateData(
            name: editName.text,
            email: editEmail.text,
            shopname: editShopName.text,
            shopAdress: editShopAdress.text,
            phone: editPhone.text,
            gender: gender,
            commercial_no: editCommerical.text,
            cityId: 1,
            latitude: 0,
            longitude: 0);
        if (res["status"] == 200) {
          CustomeAwesomeDialog().AwesomeDialogHeader(
              DialogType: DialogType.success,
              context: context,
              describe: "",
              mainTitle: "Sucessfully update your profile",
              subTitle: " Please Login again😊",
              btOnpressed: () =>
                  Get.off(LoginScreen(), binding: LoginBinding()));
          update();
        } else {
          showSnakBarMessage(msg: "Failed Updating", color: Colors.red[900]);

          isLoading = false;
          update();
        }
      } catch (e) {
        isLoading = false;
        print("something error ${e.toString()}");
      }
    }
  }
}
