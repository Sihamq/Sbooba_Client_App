import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/order/order_controller.dart';
import 'package:sizer/sizer.dart';

class GridProduct extends StatelessWidget {
  int? index;
  GridProduct({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController);
    return GetBuilder<OrderController>(
      builder: (controller) => Container(
        height: 12.h,
        width: 25.w,
        child: InkWell(
          onTap: () => controller.selectIndex(index),
          child: Card(
            elevation: 3,
            shadowColor: HexColor('#C18F3A'),
            color: index == controller.slected ? myOrange : myWhite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.h)),
            child: Center(
              child: Text(
                controller.listItems[index!],
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
