import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/Profile/profile_controller.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

import '../../shared/routes/api_routes.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Column(
          children: [
            Center(
              child: controller.profile != null
                  ? CircleAvatar(
                      backgroundColor: myOrange,
                      radius: 45.sp,
                      child: controller.profile!.data!.image == null
                          ? CircleAvatar(
                              radius: 40.sp,
                              backgroundImage:
                                  const AssetImage("assets/img.jpg"))
                          : CircleAvatar(
                              radius: 40.sp,
                              backgroundImage: NetworkImage(
                                  ApiLink.storeageImage +
                                      controller.profile!.data!.image!)),
                    )
                  : Center(
                      child: SpinKitFadingCube(
                        color: myOrange,
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: controller.profile != null
                  ? Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .70,
                        height: 19.h,
                        decoration: BoxDecoration(
                          color: myWhite,
                          //border: ,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(.5.h),
                          child: Column(
                            children: [
                              Row(
                                // spacing: 2.w,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: .5.h, left: .5, right: .5),
                                    child: Text("Openat".tr,
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    color: myOrange,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: .5.h),
                                    child: Text("24-3-2022",
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Icon(
                                    Icons.av_timer,
                                    color: myOrange,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: .5.h),
                                    child: Text("10:00 PM",
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                              Row(
                                //spacing: 2.w,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Icon(
                                    MdiIcons.store,
                                    color: myOrange,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: .5.h),
                                    child: Text(
                                        controller.profile!.data!.shopName!,
                                        style: TextStyle(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Icon(
                                    Icons.person,
                                    size: 20,
                                    color: myOrange,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: .5.h),
                                    child: Text(controller.profile!.data!.name!,
                                        style: TextStyle(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              Wrap(
                                spacing: 2,
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: myOrange,
                                  ),
                                  Text(
                                    controller.profile!.data!.phone!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Wrap(
                                spacing: 4.w,
                                children: [
                                  Text(
                                    "sales".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: myOrange),
                                  ),
                                  Text("20000" + "SAR".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: myGreen))
                                ],
                              ),
                              Wrap(
                                spacing: 3.w,
                                children: [
                                  Text(
                                    "Your Account Balance".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: myOrange),
                                  ),
                                  Text("20000" + "SAR".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: myGreen))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: SpinKitFadingCube(
                        color: myOrange,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
