import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/custom_chip.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/shared/component/add_text_formfield.dart';
import 'package:sizer/sizer.dart';

class Extra extends GetView<ProductController> {
  const Extra({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 100.w,
      child: Column(
        children: [
          MyAddTextField(
            controller: controller.arabicAdding,
            obcure: false,
            label: "اضافتك بالعربية",
            // onChange: (value) {
            //   controller.addingChipItems(value);
            // },
          ),
          SizedBox(
            height: 2.h,
          ),
          MyAddTextField(
            controller: controller.englishAdding,
            obcure: false,
            label: "اضافتك بالانجليزية",
            // onChange: (value) => controller.addingChipItemenglish(value),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Container(
              width: 12.h,
              height: 4.h,
              decoration: BoxDecoration(
                  color: myGreen,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: MaterialButton(
                //minWidth: 10.h,
                onPressed: () async {
                  controller.addingChipItems(controller.arabicAdding.text);
                  controller
                      .addingChipItemenglish(controller.englishAdding.text);
                  navigator!.pop();
                },
                child: Text("اضافة".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
