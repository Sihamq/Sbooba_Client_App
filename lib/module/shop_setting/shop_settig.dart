import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sboba_app_client/module/shared/component/small_text_field.dart';
import 'package:sizer/sizer.dart';

import '../my_colors.dart';
import '../shared/component/add_text_formfield.dart';
import '../shared/component/custom_text_field.dart';
import '../shared/component/green_button.dart';

class ShoppingSetting extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cityController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var shopController = TextEditingController();
  ShoppingSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: myBlack),
        backgroundColor: myWhite,
        title: Text(
          "Shop Setting".tr,
          style: TextStyle(color: myBlack, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
              top: 4.h,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  width: 22.h,
                  height: 15.h,
                  child: const Center(child: Icon(Icons.add_a_photo_outlined)),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(2.h),
                child: MyAddTextField(
                  controller: nameController,
                  obcure: false,
                  label: "Name".tr,
                  prefix: Icons.person,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                child: MyAddTextField(
                  controller: emailController,
                  obcure: false,
                  label: "Enter your phone".tr,
                  prefix: Icons.phone,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                child: MyAddTextField(
                  controller: passwordController,
                  obcure: false,
                  label: "Enter your Email".tr,
                  prefix: Icons.email,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                    child: MySmallTextField(
                      controller: cityController,
                      obcure: false,
                      label: "City".tr,
                      suffix: Icons.keyboard_arrow_right,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                    child: MySmallTextField(
                      controller: cityController,
                      obcure: false,
                      label: "Neighborhood".tr,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                    child: MySmallTextField(
                      controller: cityController,
                      obcure: false,
                      label: "Street".tr,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                    child: MySmallTextField(
                      controller: cityController,
                      obcure: false,
                      label: "HomeNumber".tr,
                    ),
                  ),
                ],
              ),

              BlueButton(
                  onpress: () {
                    // Get.to(() => HomeScreen());
                  },
                  title: Text(
                    "Edit".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                  hight: 7.h,
                  width: 48.h),

              //Spacer(),
            ])),
      ),
    );
  }
}
