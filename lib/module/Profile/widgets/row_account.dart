import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/Profile/widgets/total_container.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class RowAcount extends StatelessWidget {
  const RowAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: .3.h, left: 1.h, right: 1.h, bottom: .3.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(.5),
                child: Text(
                  "Your Account Balance".tr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.sp),
                ),
              ),
              Text(
                "${1000000000000}",
                style: TextStyle(
                    color: myWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp),
              )
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(.5.h),
          child: TotalContainer(),
        ),
        Padding(
          padding: EdgeInsets.all(.5.h),
          child: TotalContainer(),
        )
      ],
    );
  }
}
