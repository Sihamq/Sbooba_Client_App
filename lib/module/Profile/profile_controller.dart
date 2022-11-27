import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/data_source/profile_data/profile_data.dart';
import 'package:sboba_app_client/data/models/product_model.dart';
import 'package:sboba_app_client/data/models/profile_model.dart';

class ProfileController extends GetxController {
  var editName = TextEditingController();
  var editEmail = TextEditingController();
  var editPhone = TextEditingController();
  var editShopAdress = TextEditingController();
  var editCommerical = TextEditingController();
  var editShopName = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
}
