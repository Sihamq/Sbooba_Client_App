import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/money_with_draw/widgets/money_with_draw_controller.dart';
import 'package:sboba_app_client/module/shared/component/green_button.dart';
import 'package:sizer/sizer.dart';

import '../../my_colors.dart';
import '../../shared/component/add_text_formfield.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<moneyController>(
      init: moneyController(),
      builder: (controller) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: myGreen.withOpacity(.7),
                ),
                height: 4.h,
                width: 100.w,
                child: Center(
                  child: Text("Create a Ticket".tr,
                      style: TextStyle(
                          color: myWhite, fontWeight: FontWeight.bold)),
                )),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: MyAddTextField(
                controller: controller.amount,
                label: 'Subject'.tr,
                obcure: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: MyAddTextField(
                controller: controller.message,
                label: 'Description'.tr,
                obcure: false,
                maxline: 4,
              ),
            ),
            BlueButton(
                title: Text("Send".tr,
                    style:
                        TextStyle(color: myWhite, fontWeight: FontWeight.bold)),
                hight: 5.h,
                width: 100.w),
          ],
        ),
      ),
    );
  }
}
