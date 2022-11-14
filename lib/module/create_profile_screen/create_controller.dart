import 'dart:io';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sboba_app_client/data/data_source/auth/signUp_data.dart';
import 'package:sboba_app_client/data/models/error_signup.dart';
import 'package:sboba_app_client/module/login_screen/login_binding.dart';
import 'package:sboba_app_client/module/login_screen/login_screen_view.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/shared/component/green_button.dart';
import 'package:sizer/sizer.dart';

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

  FilePickerResult? result;
  void pickFiles(mediaXtype, bool allowMultiple) async {
    result = (await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: mediaXtype,
      allowMultiple: allowMultiple,
      withReadStream: true,
      withData: true,
    ));
    update();
    if (result == null) {
    } else {
      update();
    }
  }

  ErrorSignUp? errorSignUp;
  List<String>? sellerEmail;
  List<String>? sellerPhone;
  List<String>? sellercommerce;
  List<String>? sellershopName;

  /////////////////sign up code///////////////////////
  CreateAccount(context) async {
    if (formKey.currentState!.validate()) {
      isLaoding = true;
      try {
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
            longitude: 0);
        print(data);

        print("sucess");
        if (data["status"] == 200) {
          CustomeAwesomeDialog().AwesomeDialogHeader(
            DialogType: DialogType.success,
            context: context,
            describe: "",
            mainTitle: "Congratulations🎉",
            subTitle: "Sucessfully Sign up",
            btOnpressed: () =>
                Get.offAll(LoginScreen(), binding: LoginBinding()),
          );
        }
        // else {
        //   errorSignUp = ErrorSignUp.fromJson(data);

        //   if (errorSignUp!.sellerEmail!.isNotEmpty) {
        //     Get.snackbar(
        //       titleText: Text(
        //         "Email has already been taken",
        //         style: TextStyle(
        //             color: myWhite,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 13.sp),
        //       ),
        //       backgroundColor: myOrange,
        //       "",
        //       colorText: myWhite,
        //       snackStyle: SnackStyle.FLOATING,
        //       "",
        //       icon: Padding(
        //         padding: EdgeInsets.only(bottom: 1.h),
        //         child: Icon(
        //           Icons.password_outlined,
        //           color: Colors.white,
        //           size: 5.h,
        //         ),
        //       ),
        //       snackPosition: SnackPosition.BOTTOM,
        //       duration: Duration(seconds: 4),
        //       isDismissible: true,
        //       margin: EdgeInsets.all(15),
        //     );
        //   } else if (errorSignUp!.sellerPhone!.isNotEmpty) {
        //     Get.snackbar(
        //       titleText: Text(
        //         "Phone has already been taken ",
        //         style: TextStyle(
        //             color: myWhite,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 13.sp),
        //       ),
        //       backgroundColor: myOrange,
        //       "",
        //       colorText: myWhite,
        //       snackStyle: SnackStyle.FLOATING,
        //       "",
        //       icon: Padding(
        //         padding: EdgeInsets.only(bottom: 1.h),
        //         child: Icon(
        //           Icons.phone_android,
        //           color: Colors.white,
        //           size: 5.h,
        //         ),
        //       ),
        //       snackPosition: SnackPosition.BOTTOM,
        //       duration: Duration(seconds: 4),
        //       isDismissible: true,
        //       margin: EdgeInsets.all(15),
        //     );
        //   } else if (errorSignUp!.sellerCommercialNo!.isNotEmpty) {
        //     Get.snackbar(
        //       titleText: Text(
        //         "commericalNo. has already been taken ",
        //         style: TextStyle(
        //             color: myWhite,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 13.sp),
        //       ),
        //       backgroundColor: myOrange,
        //       "",
        //       colorText: myWhite,
        //       snackStyle: SnackStyle.FLOATING,
        //       "",
        //       icon: Padding(
        //         padding: EdgeInsets.only(bottom: 1.h),
        //         child: Icon(
        //           Icons.file_copy,
        //           color: Colors.white,
        //           size: 5.h,
        //         ),
        //       ),
        //       snackPosition: SnackPosition.BOTTOM,
        //       duration: Duration(seconds: 4),
        //       isDismissible: true,
        //       margin: EdgeInsets.all(15),
        //     );
        //   } else {
        //     Get.snackbar(
        //       titleText: Text(
        //         "Shop's Name has already been taken ",
        //         style: TextStyle(
        //             color: myWhite,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 13.sp),
        //       ),
        //       backgroundColor: Colors.red[900],
        //       "",
        //       colorText: myWhite,
        //       snackStyle: SnackStyle.FLOATING,
        //       "",
        //       icon: Padding(
        //         padding: EdgeInsets.only(bottom: 1.h),
        //         child: Icon(
        //           Icons.store,
        //           color: Colors.white,
        //           size: 5.h,
        //         ),
        //       ),
        //       snackPosition: SnackPosition.BOTTOM,
        //       duration: Duration(seconds: 4),
        //       isDismissible: true,
        //       margin: EdgeInsets.all(15),
        //     );
        //   }
        // }

        // print("failed");

        update();
      } catch (e) {
        print("${e.toString()}unknown");
      }
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
  IconData? iconVisiblity = Icons.visibility;
  showPassword() {
    isshowpassword = !isshowpassword;
    // isshowpassword = isshowpassword == true ? false : true;

    iconVisiblity =
        isshowpassword ? Icons.visibility : Icons.visibility_off_outlined;
    update();
  }
}
