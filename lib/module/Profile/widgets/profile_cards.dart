import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/lang/lang_controller.dart';
import 'package:sboba_app_client/module/Profile/profile_binding.dart';
import 'package:sboba_app_client/module/Profile/widgets/profile_card.dart';
import 'package:sboba_app_client/module/commision_history/commision_history.dart';
import 'package:sboba_app_client/module/edit_profile/edit_profile.dart';
import 'package:sboba_app_client/module/payment/payment_info/payment_info.dart';
import 'package:sboba_app_client/module/shared/component/awesome_dialog.dart';
import 'package:sboba_app_client/module/shop_setting/shop_settig.dart';
import 'package:sboba_app_client/module/verification/change_password/change_password.dart';
import 'package:sizer/sizer.dart';
import '../../login_screen/login_screen_view.dart';
import '../../money_with_draw/money_with_draw.dart';
import '../../my_colors.dart';
import '../../payment/payment_history/payment_history.dart';
import '../../shared/cash_helper.dart';
import '../../ticket/ticket_view.dart';
import 'total_container.dart';

class ProfilesCard extends StatelessWidget {
  const ProfilesCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<LanguageController>();
    return Padding(
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
                  onTap: (() =>
                      Get.to(() => const EditAccount(), binding: ProfileBinding()))),
              ProfileCard(
                  iconData: Icons.lock,
                  text: "Change Password".tr,
                  onTap: (() => Get.to(() => const ChangePassword()))),
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
                onTap: () => Get.to(() => CommisionHistory()),
              ),
              ProfileCard(
                  iconData: Icons.payment,
                  text: "Payment History".tr,
                  onTap: () => Get.to(() => const PaymentHistory()))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCard(
                iconData: MdiIcons.ticketAccount,
                text: "Support".tr,
                onTap: () => Get.to(() => const Ticket()),
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
                      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                      content: Column(children: [
                        GetBuilder<LanguageController>(
                            init: LanguageController(),
                            builder: (controller) => Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          controller.changeLang("ar");
                                          navigator!.pop();
                                        },
                                        child: Text(
                                          "Arabic".tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: myGreen),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          controller.changeLang("en");
                                          navigator!.pop();
                                        },
                                        child: Text(
                                          "English".tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
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
                            Get.off(const LoginScreen())
                          });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
