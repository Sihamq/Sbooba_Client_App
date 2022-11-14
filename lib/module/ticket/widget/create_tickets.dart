import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/add_image.dart';
import 'package:sboba_app_client/module/shared/component/add_text_formfield.dart';
import 'package:sboba_app_client/module/shared/component/green_button.dart';
import 'package:sboba_app_client/module/ticket/widget/ticket_controller.dart';
import 'package:sizer/sizer.dart';

class CreateTicket extends StatelessWidget {
  const CreateTicket({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TicketController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: myGreen.withOpacity(.6),
                ),
                height: 5.h,
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.only(left: .5.h, right: .5.h),
                  child: Center(
                    child: Text(
                      "Create a Ticket".tr,
                      style: TextStyle(
                          color: myWhite, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: MyAddTextField(
                controller: controller.subController,
                label: 'Subject'.tr,
                obcure: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: MyAddTextField(
                controller: controller.subController,
                label: 'Description'.tr,
                obcure: false,
                maxline: 4,
              ),
            ),
            AddImages(),
            BlueButton(
              title: Text(
                "Create".tr,
                style: TextStyle(color: myWhite, fontWeight: FontWeight.bold),
              ),
              hight: 6.h,
              width: 100.w,
              color: myWhite,
            )
          ],
        ),
      ),
    );
  }
}
