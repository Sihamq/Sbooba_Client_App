import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myWhite,
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Center(
          child: Column(children: [
            Icon(
              Icons.notifications_active,
              size: 70.sp,
              color: myGreen,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "nonotification".tr,
              style: TextStyle(
                  color: myOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            )
          ]),
        ),
      ),
    );
  }
}
