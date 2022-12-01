import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../../my_colors.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 13.w,
        height: 6.w,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.red[400],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          "${10}%",
          style: TextStyle(color: myWhite),
        )));
  }
}
