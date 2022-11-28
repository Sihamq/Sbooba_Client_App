import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/Profile/profile_controller.dart';
import 'package:sboba_app_client/module/Profile/widgets/coloumn_profile.dart';
import 'package:sboba_app_client/module/Profile/widgets/row_account.dart';
import 'package:sboba_app_client/module/Profile/widgets/total_container.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/shared/component/clipper.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.transparent),
        title: Text(
          "Profile".tr,
          style: TextStyle(color: myWhite, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: myGreen.withOpacity(.4),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 114.h,
          color: Colors.white,
          child: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) => Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      child: ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          child: Column(children: [RowAcount(), RowAcount()]),
                          color: myGreen.withOpacity(.4),
                          height: 36.h,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 21.h,
                      child: Row(
                        children: [
                          DottedBorder(
                            color: Colors.grey[400]!,
                            radius: Radius.circular(20),
                            strokeWidth: 4,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: myWhite,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 15.h,
                                width: 30.w,
                                child: CircleAvatar(
                                  radius: 20.h,
                                  backgroundImage:
                                      const AssetImage("assets/img.jpg"),
                                )),
                          ),
                          controller.isLoading
                              ? SpinKitPouringHourGlassRefined(
                                  color: myOrange,
                                  size: 40.sp,
                                  duration: Duration(milliseconds: 500))
                              : DottedBorder(
                                  color: Colors.grey[400]!,
                                  radius: Radius.circular(20),
                                  strokeWidth: 4,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: myWhite,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 15.h,
                                      width: 30.h,
                                      child: Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Wrap(
                                              spacing: 2.w,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: .5.h,
                                                      left: .5,
                                                      right: .5),
                                                  child: Text("Openat".tr,
                                                      style: TextStyle(
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Icon(
                                                  Icons.calendar_month,
                                                  color: myOrange,
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: .5.h),
                                                  child: Text("24-3-2022",
                                                      style: TextStyle(
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Icon(
                                                  Icons.av_timer,
                                                  color: myOrange,
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: .5.h),
                                                  child: Text("10:00 PM",
                                                      style: TextStyle(
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )
                                              ],
                                            ),
                                            Wrap(
                                              spacing: 2.w,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              children: [
                                                const Icon(
                                                  MdiIcons.store,
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: .5.h),
                                                  child: Text(
                                                      controller.profile!.data!
                                                          .shopName!,
                                                      style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                const Icon(
                                                  Icons.person,
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: .5.h),
                                                  child: Text(
                                                      controller
                                                          .profile!.data!.name!,
                                                      style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(.5.h),
                                              child: Wrap(
                                                spacing: 2,
                                                children: [
                                                  const Icon(Icons.phone),
                                                  Text(
                                                    controller
                                                        .profile!.data!.phone!,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ))),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 1.h,
                    left: 1.h,
                  ),
                  child: const ProfileColoumn(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
