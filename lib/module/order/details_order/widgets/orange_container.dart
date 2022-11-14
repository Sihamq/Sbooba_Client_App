import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../../../my_colors.dart';

class OrangeContainer extends StatelessWidget {
  IconData? icon;
  OrangeContainer({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 9.w,
        height: 8.w,
        decoration: BoxDecoration(
          color: myOrange.withOpacity(.4),
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          onTap: () {},
          child: Center(
              child: Icon(
            icon,
            color: myGreen,
            size: 2.h,
          )),
        ));
  }
}
