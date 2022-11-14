import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.h),
      ),
      child: Row(children: [
        DottedBorder(
            child: Container(
          child: Icon(
            Icons.notifications_outlined,
            color: myGreen,
            size: 10.h,
          ),
        )),
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
                "Tiltle",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text("Descrpitions")
            ],
          ),
        )
      ]),
    );
  }
}
