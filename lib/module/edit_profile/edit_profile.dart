import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sboba_app_client/data/models/profile_model.dart';
import 'package:sboba_app_client/module/Profile/profile_controller.dart';
import 'package:sboba_app_client/module/create_profile_screen/create_controller.dart';
import 'package:sboba_app_client/module/edit_profile/widgets/gender.dart';

import 'package:sboba_app_client/module/my_colors.dart';

import 'package:sizer/sizer.dart';

import '../shared/component/custom_text_field.dart';
import '../shared/component/green_button.dart';
import '../shared/function/validInput.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.white),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text(
              "Edit Profile".tr,
              style: TextStyle(color: myGreen, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.grey[50],
            elevation: 0,
            iconTheme: IconThemeData(color: myBlack),
          ),
          body: controller.profile != null
              ? Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: .2.h,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Padding(
                              //   padding: EdgeInsets.all(2.h),
                              //   child: Center(
                              //     child: Text("Edit Account".tr,
                              //         style: TextStyle(
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: 22.sp)),
                              //   ),
                              // ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    // controller.getImageBloc(ImageSource.gallery);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300],
                                      ),
                                      width: 22.h,
                                      height: 15.h,
                                      child: const Center(
                                          child:
                                              //controller.imagee == null
                                              // ?
                                              Icon(Icons.add_a_photo)
                                          // :
                                          // Image.file(controller.imagee!)
                                          )),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Text(
                                  "Personal".tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.h),
                                child: MyTextField(
                                  validate: ((p0) {
                                    return validInput(p0!, 3, 40, "name");
                                  }),
                                  controller: controller.editName,
                                  obcure: false,
                                  label: controller.profile!.data!.name!,
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
                                  controller: controller.editEmail,
                                  obcure: false,
                                  label: controller.profile!.data!.email!,
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
                                  controller: controller.editPhone,
                                  obcure: false,
                                  label: controller.profile!.data!.phone!,
                                  prefix: Icons.email,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 1.h, left: 2.h, right: 2.h),
                                child: Wrap(spacing: 3.w, children: [
                                  Text(
                                    "gender".tr,
                                    style: TextStyle(
                                        color: myOrange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                  controller.profile!.data!.gender == 1
                                      ? Text(
                                          "male".tr,
                                          style: TextStyle(
                                              color: myGreen,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp),
                                        )
                                      : Text("fmaile".tr,
                                          style: TextStyle(
                                              color: myGreen,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp))
                                ]),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 1.h, left: 2.h, right: 2.h),
                                  child: const RowGender()),
                              Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Text(
                                  "shopi".tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 2.h, left: 2.h, right: 2.h),
                                child: MyTextField(
                                  validate: ((p0) {
                                    return validInput(p0!, 3, 10, "name");
                                  }),
                                  controller: controller.editShopName,
                                  obcure: false,
                                  label: controller.profile!.data!.shopName!,
                                  prefix: Icons.home,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 2.h, left: 2.h, right: 2.h),
                                child: MyTextField(
                                  validate: ((p0) {
                                    return validInput(p0!, 3, 15, "address");
                                  }),
                                  controller: controller.editShopAdress,
                                  obcure: false,
                                  label: controller.profile!.data!.address!,
                                  prefix: Icons.home,
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 2.h, right: 2.h),
                                child: MyTextField(
                                  onChanged: (p0) => {},
                                  labelText: "Commerical Number",
                                  validate: ((p0) {
                                    return validInput(p0!, 3, 15, "number");
                                  }),
                                  controller: controller.editCommerical,
                                  obcure: false,
                                  label:
                                      controller.profile!.data!.commercialNo!,
                                  prefix: Icons.file_copy,
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //       left: 3.h, right: 3.h, top: 1.w),
                              //   child: Text(
                              //     "By Registering you agree to our terms and condition"
                              //         .tr,
                              //     style: TextStyle(
                              //         fontSize: 10.sp,
                              //         color: myOrange,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // ),

                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 3.h,
                                      top: 2.w,
                                      left: 2.h,
                                      right: 2.h),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 5.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: myWhite,
                                          border: Border.all(
                                              color: Colors.grey[400]!),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Wrap(
                                          spacing: 20.h,
                                          children: [
                                            Text(
                                              "location".tr,
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
                                    FocusScope.of(context).unfocus();
                                    controller
                                        .updateProfileInformation(context);
                                    // await controller.CreateAccount(context);
                                  },
                                  title: controller.isLoading
                                      ? SpinKitPouringHourGlass(
                                          color: myOrange,
                                        )
                                      : Text(
                                          "update".tr,
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
                )
              : Center(
                  child: SpinKitFadingCube(
                    color: myOrange,
                    size: 50.sp,
                  ),
                ),
        ),
      ),
    );
  }
}
