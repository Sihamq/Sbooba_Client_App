import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sboba_app_client/module/create_profile_screen/create_controller.dart';
import 'package:sboba_app_client/module/create_profile_screen/widgets/gender_row.dart';
import 'package:sboba_app_client/module/my_colors.dart';

import 'package:sizer/sizer.dart';

import '../shared/component/custom_text_field.dart';
import '../shared/component/green_button.dart';
import '../shared/function/validInput.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.white),
      body: GetBuilder<CreateController>(
        init: CreateController(),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            elevation: 0,
            iconTheme: IconThemeData(color: myBlack),
          ),
          body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                    top: .2.h,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Center(
                            child: Text("Create Account".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp)),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              controller.getImageBloc(ImageSource.gallery);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                width: 22.h,
                                height: 15.h,
                                child: Center(
                                    child: controller.imagee == null
                                        ? Icon(Icons.add_a_photo)
                                        : Image.file(controller.imagee!))),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Text(
                            "Personal".tr,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.h),
                          child: MyTextField(
                            validate: ((p0) {
                              return validInput(p0!, 3, 40, "name");
                            }),
                            controller: controller.nameController,
                            obcure: false,
                            label: "Enter your Name".tr,
                            prefix: Icons.email,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 2.h, left: 2.h, right: 2.h),
                          child: MyTextField(
                            validate: ((p0) {
                              return validInput(p0!, 3, 20, "email");
                            }),
                            controller: controller.emailController,
                            obcure: false,
                            label: "Enter your Email".tr,
                            prefix: Icons.email,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 2.h, left: 2.h, right: 2.h),
                          child: MyTextField(
                            validate: ((p0) {
                              return validInput(p0!, 7, 10, "phone");
                            }),
                            controller: controller.phoneController,
                            obcure: false,
                            label: "Enter your Phone".tr,
                            prefix: Icons.email,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 2.h, left: 2.h, right: 2.h),
                          child: MyTextField(
                            validate: ((p0) {
                              return validInput(p0!, 6, 12, "password");
                            }),
                            controller: controller.passwordController,
                            obcure: controller.isshowpassword,
                            label: "Enter your password".tr,
                            prefix: Icons.lock,
                            suffix: controller.iconVisiblity,
                            onTapIcon: () => controller.showPassword(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 1.h, left: 2.h, right: 2.h),
                          child: MyTextField(
                            onTapIcon: () => controller.showPassword(),
                            validate: ((p0) {
                              return validInput(p0!, 6, 12, "confirm password");
                            }),
                            controller: controller.confirmController,
                            obcure: controller.isshowpassword,
                            label: "Confirm your password".tr,
                            prefix: Icons.lock,
                            suffix: controller.iconVisiblity,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 1.h, left: 2.h, right: 2.h),
                          child: RowGender(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Text(
                            "shopi".tr,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 2.h, left: 2.h, right: 2.h),
                          child: MyTextField(
                            validate: ((p0) {
                              return validInput(p0!, 3, 10, "name");
                            }),
                            controller: controller.shopController,
                            obcure: false,
                            label: "shope".tr,
                            prefix: Icons.home,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 2.h, left: 2.h, right: 2.h),
                          child: MyTextField(
                            validate: ((p0) {
                              return validInput(p0!, 6, 15, "address");
                            }),
                            controller: controller.addressController,
                            obcure: false,
                            label: "Enter Shop's address".tr,
                            prefix: Icons.home,
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 2.h, right: 2.h),
                        //   child: DottedBorder(
                        //     borderType: BorderType.RRect,
                        //     radius: Radius.circular(12),
                        //     color: Colors.black,
                        //     strokeWidth: 2,
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: Colors.grey[300],
                        //       ),
                        //       width: 48.h,
                        //       height: 6.h,
                        //       child: Padding(
                        //         padding: EdgeInsets.all(1.h),
                        //         child: Row(
                        //           children: [
                        //             controller.result == null
                        //                 ? Text(
                        //                     "Commerical registy no".tr,
                        //                     style: TextStyle(
                        //                         fontSize: 10.sp, color: myOrange),
                        //                   )
                        //                 : Text(
                        //                     controller.result!.files.single.name,
                        //                     style: TextStyle(
                        //                         fontSize: 10.sp, color: myOrange),
                        //                   ),
                        //             Spacer(),
                        //             InkWell(
                        //               onTap: (() {
                        //                 controller.pickFiles(['pdf'], false);
                        //               }),
                        //               child: Icon(
                        //                 Icons.file_copy,
                        //                 color: HexColor('#EF9B27'),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.h, right: 2.h),
                          child: MyTextField(
                            validate: ((p0) {
                              return validInput(p0!, 3, 15, "number");
                            }),
                            controller: controller.commericalController,
                            obcure: false,
                            label: "Commerical registy no".tr,
                            prefix: Icons.file_copy,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 3.h, right: 3.h, top: 1.w),
                          child: Text(
                            "By Registering you agree to our terms and condition"
                                .tr,
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: myOrange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                bottom: 3.h, top: 2.w, left: 2.h, right: 2.h),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 5.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: myWhite,
                                    border:
                                        Border.all(color: Colors.grey[400]!),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Wrap(
                                    spacing: 20.h,
                                    children: [
                                      Text(
                                        "Show your location".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp,
                                            color: myBlack),
                                      ),
                                      Icon(
                                        Icons.map_rounded,
                                        color: myGreen,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),

                        BlueButton(
                            onpress: () async {
                              await controller.CreateAccount(context);
                            },
                            title: Text(
                              "Create".tr,
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
          ),
        ),
      ),
    );
  }
}
