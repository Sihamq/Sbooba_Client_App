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
  var ProductNameController = TextEditingController();
  var ProductDescriptionController = TextEditingController();
  var SelectCateogController = TextEditingController();
  var UnitPriceController = TextEditingController();
  var UnitController = TextEditingController();
  var miniProController = TextEditingController();
  var ProductTagController = TextEditingController();
  AddProduct({super.key});
  //Get.put(ProductController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: myBlack),
          elevation: 0,
          title: Text(
            "Add Product".tr,
            style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.bold, color: myBlack),
          ),
          backgroundColor: myWhite),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(0.5.h),
                child: MyAddTextField(
                  controller: ProductNameController,
                  obcure: false,
                  label: "Name".tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.5.h),
                child: MyAddTextField(
                    maxline: 4,
                    controller: ProductNameController,
                    obcure: false,
                    label: "Description/Ingredient".tr),
              ),
              Padding(
                padding: EdgeInsets.all(.4.h),
                child: Row(
                  children: [
                    MySmallTextField(
                      controller: UnitController,
                      obcure: false,
                      label: "Minium".tr,
                    ),
                    SizedBox(
                      width: 3.h,
                    ),
                    MySmallTextField(
                      controller: miniProController,
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
                padding: EdgeInsets.all(0.5.h),
                child: MyAddTextField(
                    controller: ProductNameController,
                    obcure: false,
                    label: "Calories".tr),
              ),
              Padding(
                padding: EdgeInsets.all(0.5.h),
                child: MyAddTextField(
                  controller: ProductNameController,
                  obcure: false,
                  label: "Tag".tr,
                  suffix: Icons.keyboard_arrow_right_outlined,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.h),
                child: AddImages(),
              ),
              Padding(
                padding: EdgeInsets.all(0.4.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "Range".tr,
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    DateContainer()
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.4.h),
                child: Row(
                  children: [
                    MySmallTextField(
                        controller: ProductTagController,
                        obcure: false,
                        label: "Quantity".tr),
                    SizedBox(
                      width: 3.h,
                    ),
                    MySmallTextField(
                      controller: ProductTagController,
                      obcure: false,
                      label: "Flat".tr,
                      suffix: Icons.arrow_drop_down,
                      suffixPressed: () {},
                    ),
                  ],
                ),
              ),
              BlueButton(
                  title: Text("Save".tr,
                      style: TextStyle(
                          color: myWhite, fontWeight: FontWeight.bold)),
                  hight: 5.h,
                  width: 100.w)
            ],
          ),
        ),
      ),
    );
  }
}
