import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import '../../my_colors.dart';

class CustomeAwesomeDialog {
  AwesomeDialogHeader(
      {context,
      mainTitle,
      subTitle,
      describe,
      void Function()? btOnpressed,
      DialogType}) {
    return AwesomeDialog(
        btnOkText: "OK".tr,
        btnCancelText: "Cancel".tr,
        title: mainTitle,
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType,
        desc: mainTitle,
        body: Padding(
          padding: EdgeInsets.all(1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(1.h),
                child: Text(
                  mainTitle,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(describe,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        btnOkOnPress: btOnpressed,
        btnCancelOnPress: () {},
        btnOkColor: myGreen)
      ..show();
  }
}
