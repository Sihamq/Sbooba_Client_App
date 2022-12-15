import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../my_colors.dart';

class MoneyCard extends StatelessWidget {
  String? text;
  MoneyCard({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.h),
      ),
      child: Row(children: [
        DottedBorder(
            borderType: BorderType.Rect,
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 9.h,
                width: 12.h,
                child: Center(
                  child: Text(
                    "6786767",
                    style: TextStyle(
                        color: myGreen,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ))),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 2.w,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: myOrange,
                    size: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text("24-3-2022", style: TextStyle(fontSize: 7.sp)),
                  ),
                  Icon(
                    Icons.av_timer,
                    color: myOrange,
                    size: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text("10:00 PM", style: TextStyle(fontSize: 7.sp)),
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Subject",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                    color: myOrange),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 14.w,
                height: 3.h,
                decoration: BoxDecoration(
                    color: myGreen.withOpacity(.6),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    text!,
                    style: TextStyle(color: myWhite, fontSize: 10.sp),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
