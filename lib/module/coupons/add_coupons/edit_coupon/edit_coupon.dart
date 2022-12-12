import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/data/models/coupons.dart';
import 'package:sboba_app_client/module/coupons/coupons_controller.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/date_container.dart';
import 'package:sboba_app_client/module/shared/component/add_text_formfield.dart';
import 'package:sboba_app_client/module/shared/component/small_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../../my_colors.dart';
import '../../../shared/component/green_button.dart';

class EditCoupon extends GetView<CouponsController> {
  CouponsItems? couponsItems;
  int? index;
  EditCoupon({super.key, this.couponsItems, this.index});

  @override
  Widget build(BuildContext context) {
    controller.initData(couponsItems!);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myWhite,
        title: Text("Editc".tr),
      ),
      body: GetBuilder<CouponsController>(
        init: CouponsController(),
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 4.h, left: 1.h, right: 1.h),
            child: Form(
              key: controller.formKey2,
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300],
                  ),
                  height: 5.h,
                  width: 100.w,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Text(
                            "Product".tr,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        child: Icon(Icons.arrow_right),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                      controller: controller.editCouponCode,
                      obcure: false,
                      label: "Coupon Code".tr),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                    controller: controller.editcouponType,
                    type: TextInputType.number,
                    obcure: false,
                    label: "typec".tr,
                    //suffix: MdiIcons.arrowDownBold,
                    suffixPressed: () {},
                  ),
                ),

                // DecoratedBox(
                //                   decoration: BoxDecoration(
                //                       color: Colors
                //                           .white, //background color of dropdown button
                //                       border: Border.all(
                //                           color: myOrange,
                //                           width: 2), //border of dropdown button
                //                       borderRadius: BorderRadius.circular(
                //                           15), //border raiuds of dropdown button
                //                       boxShadow: <BoxShadow>[
                //                         //apply shadow on Dropdown button
                //                         BoxShadow(
                //                             color: myOrange,
                //                             blurRadius: 0.1), //shadow for button
                //                       ]),
                //                   child: DropdownButton(
                //                     autofocus: true,
                //                     dropdownColor: myWhite,
                //                     focusColor: myOrange,
                //                     // isExpanded: true,
                //                     underline: const SizedBox(),
                //                     elevation: 2,
                //                     hint: Center(
                //                       child: controller.catSelect == null
                //                           ? Padding(
                //                               padding: EdgeInsets.all(1.h),
                //                               child: Text(
                //                                 "kind".tr,
                //                                 style: TextStyle(fontSize: 13.sp),
                //                               ),
                //                             )
                //                           : Text(
                //                               controller.catSelect,
                //                               style: TextStyle(fontSize: 13.sp),
                //                             ),
                //                     ),
                //                     alignment: AlignmentDirectional.center,
                //                     iconSize: 20.sp,
                //                     icon: Icon(
                //                       Icons.keyboard_arrow_down,
                //                       color: myOrange,
                //                       size: 25.sp,
                //                     ),
                //                     items: controller.discountTypeList
                //                         .map<DropdownMenuItem>(
                //                             (cat) => DropdownMenuItem(
                //                                   value: cat,
                //                                   child: Center(
                //                                     child: Text(di),
                //                                   ),
                //                                 ))
                //                         .toList(),
                //                     onChanged: ((value) {
                //                       controller.changeSelectCategory(value);
                //                     }),
                //                   )
                //                   // MySmallTextField(
                //                   //   type: TextInputType.number,
                //                   //   controller: controller.miniProController,
                //                   //   obcure: false,
                //                   //   label: "Candy".tr,
                //                   //   suffix: Icons.arrow_right_alt,
                //                   //   suffixPressed: () {
                //                   //     Get.defaultDialog(
                //                   //         title: "'",
                //                   //         content: CustomRdaioButton(),
                //                   //         middleText: "😊");
                //                   //   },
                //                   ),

                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyAddTextField(
                    controller: controller.editDisountType,
                    type: TextInputType.number,
                    obcure: false,
                    label: "Discount Type".tr,
                    suffix: MdiIcons.arrowDownBold,
                    suffixPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(.5.h),
                  child: Row(
                    children: [
                      MySmallTextField(
                          controller: controller.editDiscount,
                          type: TextInputType.number,
                          obcure: false,
                          label: "Discount".tr),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "Discount Date Rang".tr,
                      ),
                      DateContainer(),
                    ],
                  ),
                ),
                BlueButton(
                    onpress: () {
                      FocusScope.of(context).unfocus();
                      controller.updateCoupon(id: couponsItems!.id);
                    },
                    title: Text("Save".tr,
                        style: TextStyle(
                            color: myWhite, fontWeight: FontWeight.bold)),
                    hight: 5.h,
                    width: 100.w)
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
