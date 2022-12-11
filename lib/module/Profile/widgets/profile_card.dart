import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class ProfileCard extends StatelessWidget {
  String? text;
  IconData? iconData;
  void Function()? onTap;
  ProfileCard({super.key, this.text, this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        height: 17.h,
        width: 16.h,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          color: myWhite,
          child: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    color: myOrange,
                    size: 25.sp,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    text!,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
