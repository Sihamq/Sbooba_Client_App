import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:sboba_app_client/data/data_source/auth/signUp_data.dart';
import 'package:sboba_app_client/data/models/error_signup.dart';
import 'package:sboba_app_client/module/login_screen/login_binding.dart';
import 'package:sboba_app_client/module/login_screen/login_screen_view.dart';
import 'package:sboba_app_client/module/shared/component/snack_message.dart';

import '../shared/component/awesome_dialog.dart';

class CreateController extends GetxController {
  var nameController;
  var passwordController;

  var addressController;
  var emailController;
  var confirmController;
  var phoneController;
  var commericalController;

  int? gender = 0;

  var shopController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLaoding = false;
  final picker = ImagePicker();
  var pickedFile;
  File? imagee;
  changeGender(value) {
    gender = value;
    update();
  }

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
  //var pickedFile;

  // FilePickerResult? result;
  // void pickFiles(mediaXtype, bool allowMultiple) async {
  //   result = (await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: mediaXtype,
  //     allowMultiple: allowMultiple,
  //     withReadStream: true,
  //     withData: true,
  //   ));
  //   update();
  //   if (result == null) {
  //   } else {
  //     update();
  //   }
  // }

  ErrorSignUp? errorSignUp;
  List<String>? sellerEmail;
  List<String>? sellerPhone;
  List<String>? sellercommerce;
  List<String>? sellershopName;

  /////////////////sign up code///////////////////////
  CreateAccount(context) async {
    if (formKey.currentState!.validate()) {
      try {
        // isLaoding = true;
        print(nameController.value.text);
        var data = await SignupData().postData(
            name: nameController.text,
            email: emailController.text,
            pasword: passwordController.text,
            confirmPassword: confirmController.text,
            shopname: shopController.text,
            shopAdress: addressController.text,
            phone: phoneController.text,
            commercial_no: commericalController.text,
            cityId: 1,
            gender: gender,
            latitude: 0,
            longitude: 0,
            image: MultipartFile.fromFileSync(imagee!.path));
        print(data);

        print("sucess");
        if (data["status"] == 200) {
          //  isLaoding = false;
          CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: context,
            describe: "",
            mainTitle: "congra".tr,
            subTitle: "signup".tr,
            btOnpressed: () =>
                Get.offAll(LoginScreen(), binding: LoginBinding()),
          );
        }
        var res = data["seller.email"];
        var res1 = data["seller.phone"];
        var res2 = data["seller.shop_name"];
        var res3 = data["seller.commercial_no"];

        print(res);
        // var tagsJson = jsonDecode(data)['seller.email'];
        List<String> tags = [];
        tags = res != null ? List.from(res) : [];
        List<String> tags1 = [];
        tags1 = res1 != null ? List.from(res1) : [];
        List<String> tags2 = [];
        tags2 = res2 != null ? List.from(res2) : [];
        List<String> tags3 = [];
        tags3 = res3 != null ? List.from(res3) : [];

        print("tags$tags");
        if (tags.isNotEmpty) {
          isLaoding = false;
          showSnakBarMessage(msg: "emailistaken".tr, color: Colors.red[900]);
        } else if (tags1.isNotEmpty) {
          isLaoding = false;
          showSnakBarMessage(msg: "phoneistaken".tr, color: Colors.red[900]);
        } else if (tags2.isNotEmpty) {
          isLaoding = false;
          showSnakBarMessage(msg: "Shopnameistaken".tr, color: Colors.red[900]);
        } else if (tags3.isNotEmpty) {
          isLaoding = false;
          showSnakBarMessage(
              msg: "commericalistaken".tr, color: Colors.red[900]);
        }

        update();
      } catch (e) {
        print(" error sign up is${e.toString()}unknown");
      }
      //  isLaoding = false;
    }
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    confirmController = TextEditingController();
    phoneController = TextEditingController();
    commericalController = TextEditingController();

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

  bool isshowpassword = true;
  bool ischecked = true;
  IconData? iconVisiblity = Icons.visibility_off;
  IconData? iconCVisiblity = Icons.visibility_off;
  /////////////// pass
  showPassword() {
    isshowpassword = !isshowpassword;
    // isshowpassword = isshowpassword == true ? false : true;

    iconVisiblity = isshowpassword ? Icons.visibility_off : Icons.visibility;
    update();
  }
  //////////////////confirm pass

  showCheckedPassword() {
    ischecked = !ischecked;

    iconCVisiblity = ischecked ? Icons.visibility_off : Icons.visibility;
    update();
  }
}
