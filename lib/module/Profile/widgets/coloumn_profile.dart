import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/Profile/profile_binding.dart';
import 'package:sboba_app_client/module/Profile/widgets/row_profile.dart';
import 'package:sboba_app_client/module/edit_profile/edit_profile.dart';
import 'package:sboba_app_client/module/login_screen/login_screen_view.dart';
import 'package:sboba_app_client/module/money_with_draw/money_with_draw.dart';
import 'package:sboba_app_client/module/payment/payment_history/payment_history.dart';
import 'package:sboba_app_client/module/payment/payment_info/payment_info.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/module/ticket/ticket_view.dart';
import 'package:sboba_app_client/module/verification/change_password/change_password.dart';
import 'package:sizer/sizer.dart';

import '../../../lang/lang_controller.dart';
import '../../my_colors.dart';
import '../../shared/component/awesome_dialog.dart';
import '../../shop_setting/shop_settig.dart';

class ProfileColoumn extends StatelessWidget {
  const ProfileColoumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(1.h),
          child: InkWell(
            onTap: (() => Get.to((ShoppingSetting()))),
            child:
                ProfileRow(iconData: Icons.settings, text: "Shop Setting".tr),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: InkWell(
              child:
                  ProfileRow(iconData: Icons.person, text: "Edit Profile".tr),
              onTap: (() =>
                  Get.to(() => EditAccount(), binding: ProfileBinding()))),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: InkWell(
            onTap: (() => ChangePassword()),
            child: ProfileRow(iconData: Icons.lock, text: "Change Password".tr),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: InkWell(
              child: ProfileRow(iconData: Icons.print, text: "Payment Info".tr),
              onTap: () => Get.to(
                    () => PaymentInfo(),
                  )),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: InkWell(
            onTap: () => Get.to(() => Ticket()),
            child: ProfileRow(
                iconData: MdiIcons.ticketAccount, text: "Support".tr),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: ProfileRow(
              iconData: Icons.file_copy, text: "Commision History".tr),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: InkWell(
              onTap: () => Get.to(() => MoneyWithDraw()),
              child: ProfileRow(
                  iconData: Icons.money, text: "Money with draw".tr)),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: InkWell(
              child: ProfileRow(
                  iconData: Icons.payment, text: "Payment History".tr),
              onTap: () => Get.to(() => PaymentHistory())),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: ProfileRow(iconData: Icons.star, text: "Product Review".tr),
        ),
        InkWell(
          onTap: (() => Get.defaultDialog(
              backgroundColor: myWhite,
              buttonColor: myGreen,
              title: "Language".tr,
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
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
                                  Navigator.pop(context);
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
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: ProfileRow(iconData: Icons.language, text: "lan".tr),
          ),
        ),
        InkWell(
          onTap: () {
            CustomeAwesomeDialog().AwesomeDialogHeader(
                DialogType: DialogType.question,
                context: context,
                describe: "",
                subTitle: "leave".tr,
                mainTitle: "",
                btOnpressed: () =>
                    {CashHelper.removeData("token"), Get.off(LoginScreen())});
          },
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: ProfileRow(iconData: Icons.logout, text: "Logout".tr),
          ),
        ),
      ],
    );
  }
}
