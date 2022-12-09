import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sizer/sizer.dart';

import '../../my_colors.dart';

class ProductCateogry extends GetView<ProductController> {
  int? x;
  ProductCateogry({super.key, this.x});

  @override
  Widget build(BuildContext context) {
    //controller.getCateogries();
    return GetBuilder<ProductController>(
      builder: (controller) => InkWell(
        onTap: (() => controller.getSelected(x)),
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:
                controller.selected == x ? myOrange : myGreen.withOpacity(.1),
          ),
          height: controller.selected == x ? 5.h : 3.h,
          width: controller.selected == x ? 10.h : 15.h,
          // alignment: controller.selected == x
          //     ? Alignment(-1.0, -1.0)
          //     : Alignment(1.0, 1.0),
          child: Center(
            child: Text(
              controller.category!.data![x!].name!,
              style: TextStyle(
                  color: controller.selected == x ? myWhite : myBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp),
            ),
          ),
        ),
      ),
    );
  }
}
