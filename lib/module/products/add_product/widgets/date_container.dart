import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../../../my_colors.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Container(
          width: 12.w,
          height: 7.w,
          decoration: BoxDecoration(
            color: myGreen,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Icon(
            Icons.calendar_month,
            color: Colors.white,
          ))),
    );
  }
}
