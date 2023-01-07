import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class CateogryCard extends StatelessWidget {
  String? text;
  String? iconData;
  void Function()? onTap;
  CateogryCard({super.key, this.text, this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        height: 20.h,
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
                  ImageIcon(
                    AssetImage(iconData!),
                    color: myOrange,
                    size: 50.sp,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: myGreen, fontWeight: FontWeight.bold),
                    text!,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
