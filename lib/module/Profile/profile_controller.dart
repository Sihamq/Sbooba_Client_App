import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';
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

  String? img;
  initData(Profile item) {
    editName.text = item.data!.name!;
    editEmail.text = item.data!.email!;
    editPhone.text = item.data!.phone!;
    editShopName.text = item.data!.shopName!;
    editShopAdress.text = item.data!.address!;
    editCommerical.text = item.data!.commercialNo!;
    img = item.data!.image;
    gender = item.data!.gender;
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
  int? genterTo;
  changeGender(value) {
    gender = value;
    genterTo = 1;
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

  final picker = ImagePicker();
  var pickedFile;
  File? imagee;
  Future getImageBloc(ImageSource src) async {
    pickedFile = await picker.pickImage(source: src, imageQuality: 50);
    if (pickedFile != null) {
      imagee = File(pickedFile.path);
      update();
      print("image selected");
    } else {
      print("no image selected");
    }
  }

  /////////////////////update profile////////////////////////////////
  updateProfileInformation(context) async {
    print(editName.text);

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
            longitude: 0,
            image: imagee == null
                ? null
                : MultipartFile.fromFileSync(imagee!.path));
        if (res["status"] == 200) {
          CustomeAwesomeDialog().AwesomeDialogHeader(
              DialogType: DialogType.success,
              context: context,
              describe: "",
              mainTitle: "",
              subTitle: "upprofile".tr,
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
