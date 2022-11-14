import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import '../../my_colors.dart';

class CustomeAwesomeInputDialog {
  AwesomeDialogInputHeader({context, mainTitle, controller, hintText}) {
    return AwesomeDialog(
        btnOkText: "Send".tr,
        title: mainTitle,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.warning,
        desc: mainTitle,
        descTextStyle: TextStyle(fontWeight: FontWeight.bold),
        body: Center(
            child: Form(
                child: Padding(
          padding: EdgeInsets.all(1.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(1.h),
                child: Text(
                  mainTitle,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
              ),
              Material(
                elevation: 4,
                shadowColor: myGreen.withOpacity(.1),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusColor: myGreen,
                    hintText: hintText,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: controller,
                ),
              ),
            ],
          ),
        ))),
        btnOkOnPress: () {},
        btnOkColor: myGreen)
      ..show();
  }
}
