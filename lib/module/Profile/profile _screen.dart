import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/Profile/profile_binding.dart';
import 'package:sboba_app_client/module/Profile/profile_controller.dart';
import 'package:sboba_app_client/module/Profile/widgets/profile_card.dart';
import 'package:sboba_app_client/module/Profile/widgets/total_container.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/module/shop_setting/shop_settig.dart';
import 'package:sizer/sizer.dart';

import '../../lang/lang_controller.dart';
import '../edit_profile/edit_profile.dart';
import '../login_screen/login_screen_view.dart';
import '../money_with_draw/money_with_draw.dart';
import '../payment/payment_history/payment_history.dart';
import '../payment/payment_info/payment_info.dart';
import '../shared/component/awesome_dialog.dart';
import '../ticket/ticket_view.dart';
import '../verification/change_password/change_password.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) => Stack(children: [
              Column(
                children: [
                  Stack(
                    //  alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .3,
                        decoration: BoxDecoration(color: myGreen.withOpacity(.1)
                            // gradient: LinearGradient(
                            //     colors: [myGreen, myOrange.withOpacity(.7)],
                            //     begin: Alignment.topLeft,
                            //     end: Alignment.bottomRight),
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                  backgroundColor: myOrange,
                                  radius: 45.sp,
                                  child: CircleAvatar(
                                    radius: 40.sp,
                                    backgroundImage:
                                        const AssetImage("assets/img.jpg"),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.h),
                              child: controller.profile != null
                                  ? Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 5,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .75,
                                        height: 19.h,
                                        decoration: BoxDecoration(
                                          color: myWhite,
                                          //border: ,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(.5.h),
                                          child: Column(
                                            children: [
                                              Row(
                                                // spacing: 2.w,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                                FontWeight
                                                                    .bold)),
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
                                                                FontWeight
                                                                    .bold)),
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
                                                                FontWeight
                                                                    .bold)),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                //spacing: 2.w,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                    padding: EdgeInsets.only(
                                                        top: .5.h),
                                                    child: Text(
                                                        controller.profile!
                                                            .data!.shopName!,
                                                        style: TextStyle(
                                                            fontSize: 9.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  Icon(
                                                    Icons.person,
                                                    size: 20,
                                                    color: myOrange,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: .5.h),
                                                    child: Text(
                                                        controller.profile!
                                                            .data!.name!,
                                                        style: TextStyle(
                                                            fontSize: 9.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
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
                                                    controller
                                                        .profile!.data!.phone!,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              Wrap(
                                                spacing: 4.w,
                                                children: [
                                                  Text(
                                                    "sales".tr,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: myOrange),
                                                  ),
                                                  Text("20000" + "SAR".tr,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: myGreen))
                                                ],
                                              ),
                                              Wrap(
                                                spacing: 3.w,
                                                children: [
                                                  Text(
                                                    "Your Account Balance".tr,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: myOrange),
                                                  ),
                                                  Text("20000" + "SAR".tr,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h, left: 1.h, right: 1.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            //  spacing: 2.w,
                            children: [
                              TotalContainer(secondText: "totalOrder".tr),
                              SizedBox(
                                width: .5.h,
                              ),
                              TotalContainer(
                                secondText: "Total Products".tr,
                              ),
                              SizedBox(
                                width: .5.h,
                              ),
                              TotalContainer(
                                secondText: "sucess".tr,
                              ),
                              SizedBox(
                                width: .5.h,
                              ),
                              TotalContainer(
                                secondText: "canceled".tr,
                              )
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileCard(
                              text: "Shop Setting".tr,
                              iconData: Icons.settings,
                              onTap: () => Get.to((ShoppingSetting())),
                            ),
                            ProfileCard(
                                iconData: Icons.person,
                                text: "Edit Profile".tr,
                                onTap: (() => Get.to(() => EditAccount(),
                                    binding: ProfileBinding()))),
                            ProfileCard(
                                iconData: Icons.lock,
                                text: "Change Password".tr,
                                onTap: (() => Get.to(() => ChangePassword()))),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileCard(
                              iconData: Icons.print,
                              text: "Payment Info".tr,
                              onTap: () => Get.to(
                                () => PaymentInfo(),
                              ),
                            ),
                            ProfileCard(
                              iconData: Icons.file_copy,
                              text: "Commision History".tr,
                              onTap: () => Get.to(() => MoneyWithDraw()),
                            ),
                            ProfileCard(
                                iconData: Icons.payment,
                                text: "Payment History".tr,
                                onTap: () => Get.to(() => PaymentHistory()))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileCard(
                              iconData: MdiIcons.ticketAccount,
                              text: "Support".tr,
                              onTap: () => Get.to(() => Ticket()),
                            ),
                            ProfileCard(
                              text: "MoneyWithDraw".tr,
                              iconData: Icons.money,
                              onTap: () {
                                Get.to(() => MoneyWithDraw());
                              },
                            ),
                            ProfileCard(
                              iconData: Icons.star,
                              text: "Product Review".tr,
                              onTap: () {
                                // Get.to(() => MoneyWithDraw());
                              },
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileCard(
                                iconData: Icons.language,
                                text: "lan".tr,
                                onTap: () => Get.defaultDialog(
                                    backgroundColor: myWhite,
                                    buttonColor: myGreen,
                                    title: "Language".tr,
                                    titleStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    content: Column(children: [
                                      GetBuilder<LanguageController>(
                                          init: LanguageController(),
                                          builder: (controller) => Column(
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        controller
                                                            .changeLang("ar");
                                                        navigator!.pop();
                                                      },
                                                      child: Text(
                                                        "Arabic".tr,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: myGreen),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        controller
                                                            .changeLang("en");
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "English".tr,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: myGreen),
                                                      ))
                                                ],
                                              )),
                                    ]))),
                            ProfileCard(
                              iconData: Icons.logout,
                              text: "Logout".tr,
                              onTap: () {
                                CustomeAwesomeDialog().AwesomeDialogHeader(
                                    DialogType: DialogType.question,
                                    context: context,
                                    describe: "",
                                    subTitle: "leave".tr,
                                    mainTitle: "",
                                    btOnpressed: () => {
                                          CashHelper.removeData("token"),
                                          Get.off(LoginScreen())
                                        });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // PositionedDirectional(
              //   start: MediaQuery.of(context).size.width * 0.099,
              //   // start: MediaQuery.of(context).size.width * 0.73999,
              //   top: MediaQuery.of(context).size.width * 0.73999,
              //   // left: MediaQuery.of(context).size.width * 0.099,
              //   end: MediaQuery.of(context).size.width * 0.099,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //  spacing: 2.w,
              //     children: [
              //       TotalContainer(secondText: "totalOrder".tr),
              //       TotalContainer(
              //         secondText: "Total Products".tr,
              //       ),
              //       TotalContainer(
              //         secondText: "sucess".tr,
              //       ),
              //       TotalContainer(
              //         secondText: "canceled".tr,
              //       )
              //     ],
              //   ),
              // )
            ]),
          ),
        ),
      ),
    );
  }
}
