import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../my_colors.dart';
import '../order_controller.dart';

class OrderCatogrey extends StatelessWidget {
  int? x;
  OrderCatogrey({super.key, this.x});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) => InkWell(
        onTap: (() => controller.getSelected(x)),
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: controller.selected == x ? myOrange : myWhite,
          ),
          height: controller.selected == x ? 5.h : 3.h,
          width: controller.selected == x ? 10.h : 15.h,
          // alignment: controller.selected == x
          //     ? Alignment(-1.0, -1.0)
          //     : Alignment(1.0, 1.0),
          child: Center(
            child: Text(
              "All",
              style: TextStyle(
                  color: controller.selected == x ? myWhite : myBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
