import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/models/cateogry.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/add_image.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/custom_radio_buttons.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/date_container.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/shared/component/custom_text_field.dart';
import 'package:sboba_app_client/module/shared/component/green_button.dart';
import 'package:sboba_app_client/module/shared/component/small_text_field.dart';
import 'package:sboba_app_client/module/shared/function/validInput.dart';
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
                fontSize: 12.sp, fontWeight: FontWeight.bold, color: myGreen),
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
                    controller: controller.productNameArabicController,
                    obcure: false,
                    label: "Name".tr,
                    validate: (p0) => validInput(p0!, 3, 12, "name"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                    controller: controller.productNameEnglishController,
                    obcure: false,
                    label: "name".tr,
                    validate: (p0) => validInput(p0!, 3, 12, "name"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                      type: TextInputType.number,
                      controller: controller.productCaloriesController,
                      obcure: false,
                      label: "Calories".tr),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                    controller: controller.productTagController,
                    obcure: false,
                    label: "Tag".tr,
                    // suffix: Icons.keyboard_arrow_right_outlined,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                      maxline: 4,
                      controller: controller.productDescriptionArabicController,
                      obcure: false,
                      label: "Description/Ingredient".tr),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                      maxline: 4,
                      controller:
                          controller.productDescriptionEnglishController,
                      obcure: false,
                      label: "Ingredient".tr),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      MySmallTextField(
                          controller: controller.miniProController,
                          obcure: false,
                          type: TextInputType.number,
                          label: "Quantity".tr),
                      SizedBox(
                        width: .5.h,
                      ),
                      MySmallTextField(
                        controller: controller.productAvialbleController,
                        obcure: false,
                        label: "Minium".tr,
                        type: TextInputType.number,
                        validate: (p0) => validInput(p0!, 3, 12, "name"),
                      ),
                      // SizedBox(
                      //   width: .5.h,
                      // ),
                      // MySmallTextField(
                      //   controller: controller.productTagController,
                      //   obcure: false,
                      //   label: "Flat".tr,
                      //   suffix: Icons.arrow_drop_down,
                      //   suffixPressed: () {},
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      MySmallTextField(
                          type: TextInputType.number,
                          controller: controller.unitPriceController,
                          obcure: false,
                          label: "unitprice".tr),
                      SizedBox(
                        width: .5.h,
                      ),
                      MySmallTextField(
                          controller: controller.unitPurchesController,
                          obcure: false,
                          label: "unitpurchesprice".tr,
                          type: TextInputType.number),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      // SizedBox(
                      //   width: 1.h,
                      // ),
                      Expanded(
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors
                                    .white, //background color of dropdown button
                                border: Border.all(
                                    color: myOrange,
                                    width: 2), //border of dropdown button
                                borderRadius: BorderRadius.circular(
                                    20), //border raiuds of dropdown button
                                boxShadow: <BoxShadow>[
                                  //apply shadow on Dropdown button
                                  BoxShadow(
                                      color: myOrange,
                                      blurRadius: 0.1), //shadow for button
                                ]),
                            child: DropdownButton(
                              autofocus: true,
                              dropdownColor: myWhite,
                              focusColor: myOrange,
                              // isExpanded: true,
                              underline: const SizedBox(),
                              elevation: 2,
                              hint: Center(
                                child: controller.catSelect == null
                                    ? Text(
                                        "        kind   of    product",
                                        style: TextStyle(fontSize: 13.sp),
                                      )
                                    : Text(
                                        controller.catSelect,
                                        style: TextStyle(fontSize: 13.sp),
                                      ),
                              ),
                              alignment: AlignmentDirectional.center,
                              iconSize: 20.sp,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: myOrange,
                                size: 25.sp,
                              ),
                              items: controller.productCateogry
                                  .map<DropdownMenuItem<CateogryItems>>(
                                      (cat) => DropdownMenuItem(
                                            value: cat,
                                            child: Center(
                                              child: Text(cat.name!),
                                            ),
                                          ))
                                  .toList(),
                              onChanged: ((value) {
                                controller.changeSelectCategory(value);
                              }),
                            )
                            // MySmallTextField(
                            //   type: TextInputType.number,
                            //   controller: controller.miniProController,
                            //   obcure: false,
                            //   label: "Candy".tr,
                            //   suffix: Icons.arrow_right_alt,
                            //   suffixPressed: () {
                            //     Get.defaultDialog(
                            //         title: "'",
                            //         content: CustomRdaioButton(),
                            //         middleText: "😊");
                            //   },
                            ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Container(
                    width: 100.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]),
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Row(
                        children: [
                          Text(
                            "Featured".tr,
                            style: TextStyle(
                                color: myGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),
                          const Spacer(),
                          Switch(
                            focusColor: myOrange,
                            value: controller.swittch,
                            onChanged: (value) {
                              controller.changSwitch(value);
                            },
                            activeColor: myOrange,
                            inactiveThumbColor: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Container(
                    width: 100.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]),
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Row(
                        children: [
                          Text(
                            "Published".tr,
                            style: TextStyle(
                                color: myGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),
                          const Spacer(),
                          Switch(
                            focusColor: myOrange,
                            value: controller.featured,
                            onChanged: (value) {
                              controller.changeFeaturedswitch(value);
                            },
                            activeColor: myOrange,
                            inactiveThumbColor: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: AddImages(),
                ),
                Padding(
                  padding: EdgeInsets.all(.5.h),
                  child: Wrap(children: [
                    Text(
                      "Range".tr,
                      style: TextStyle(
                          color: myOrange,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const DateContainer(),
                    MySmallTextField(
                      label: "Discount".tr,
                      type: TextInputType.number,
                      controller: controller.productDiscountController,
                      obcure: false,
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Obx(
                    () => Column(
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
                              "${"start".tr}       ${controller.startDate.value}",
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
                              "end".tr + "    ${controller.endDate.value}",
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
                ),
                BlueButton(
                    onpress: () async {
                      print("stoore");
                      FocusScope.of(context).unfocus();
                      await controller.storeProduct();
                    },
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
