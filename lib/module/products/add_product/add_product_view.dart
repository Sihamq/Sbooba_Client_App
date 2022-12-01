import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/add_image.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/custom_radio_buttons.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/date_container.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/shared/component/custom_text_field.dart';
import 'package:sboba_app_client/module/shared/component/green_button.dart';
import 'package:sboba_app_client/module/shared/component/small_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../shared/component/add_text_formfield.dart';

class AddProduct extends GetView<ProductController> {
  AddProduct({super.key});
  //Get.put(ProductController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: myBlack),
          elevation: 0,
          title: Text(
            "Add Product".tr,
            style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.bold, color: myBlack),
          ),
          backgroundColor: myWhite),
      body: GetBuilder<ProductController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                    controller: controller.ProductNameController,
                    obcure: false,
                    label: "Name".tr,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                      maxline: 4,
                      controller: controller.ProductNameController,
                      obcure: false,
                      label: "Description/Ingredient".tr),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      MySmallTextField(
                        controller: controller.UnitController,
                        obcure: false,
                        label: "Minium".tr,
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      MySmallTextField(
                        controller: controller.miniProController,
                        obcure: false,
                        label: "Candy".tr,
                        suffix: Icons.arrow_right_alt,
                        suffixPressed: () {
                          Get.defaultDialog(
                              title: "'",
                              content: CustomRdaioButton(),
                              middleText: "😊");
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                      controller: controller.ProductNameController,
                      obcure: false,
                      label: "Calories".tr),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                    controller: controller.ProductNameController,
                    obcure: false,
                    label: "Tag".tr,
                    suffix: Icons.keyboard_arrow_right_outlined,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      MySmallTextField(
                          controller: controller.ProductTagController,
                          obcure: false,
                          label: "Quantity".tr),
                      SizedBox(
                        width: .5.h,
                      ),
                      MySmallTextField(
                        controller: controller.ProductTagController,
                        obcure: false,
                        label: "Flat".tr,
                        suffix: Icons.arrow_drop_down,
                        suffixPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: AddImages(),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "Range".tr,
                        style: TextStyle(
                            color: myOrange,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Wrap(spacing: 2.w, children: [
                        DateContainer(),
                        MySmallTextField(
                          label: "Discount",
                          type: TextInputType.number,
                          controller: controller.ProductTagController,
                          obcure: false,
                        )
                      ])
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300]),
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Text(
                            "Start Date is : ${controller.startDate}",
                            style: TextStyle(
                                color: myBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        width: 100.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300]),
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Text(
                            "End Date is :    ${controller.endDate}",
                            style: TextStyle(
                                color: myBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlueButton(
                    title: Text("Save".tr,
                        style: TextStyle(
                            color: myWhite, fontWeight: FontWeight.bold)),
                    hight: 7.h,
                    width: 100.w)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
