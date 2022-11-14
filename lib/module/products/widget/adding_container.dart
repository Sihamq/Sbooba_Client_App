import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../../my_colors.dart';

class AddingContainer extends StatelessWidget {
  String? label;
  String? btnTitle;
  double? noOfPro;
  void Function()? onTap;
  AddingContainer(
      {super.key, this.noOfPro, this.onTap, this.btnTitle, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myGreen.withOpacity(.1),
        height: 5.h,
        width: 100.w,
        child: Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              children: [
                Text(
                  label!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${noOfPro}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    height: 15.h,
                    width: 15.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: myGreen,
                    ),
                    child: Center(
                      child: Text(
                        btnTitle!,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
