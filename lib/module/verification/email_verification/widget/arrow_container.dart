import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:sizer/sizer.dart';

import '../../../my_colors.dart';

class ArrowContainer extends StatelessWidget {
  const ArrowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Container(
          width: 12.w,
          height: 3.w,
          decoration: BoxDecoration(
            color: myGreen,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ))),
    );
  }
}
