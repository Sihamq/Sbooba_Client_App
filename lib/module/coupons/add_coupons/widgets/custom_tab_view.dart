import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/data/models/list_product.dart';
import 'package:sboba_app_client/module/coupons/coupons_controller.dart';
import 'package:sboba_app_client/module/coupons/widget/date_coupon.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/date_container.dart';
import 'package:sboba_app_client/module/shared/component/add_text_formfield.dart';
import 'package:sboba_app_client/module/shared/component/small_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/models/cateogry.dart';
import '../../../my_colors.dart';
import '../../../shared/component/green_button.dart';
import '../../../shared/function/validInput.dart';

class CustomTabView extends GetView<CouponsController> {
  const CustomTabView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getProductList();
    return SingleChildScrollView(
      child: Obx(
        () => Form(
          key: controller.formKey1,
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
                    child: Text(
                      "Product".tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    child: const Icon(Icons.arrow_right),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => Obx(
                                () => Dialog(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: ListView(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: Container(
                                          // ignore: sort_child_properties_last
                                          child: Center(
                                            child: Text(
                                              "اختر المنتج",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: myGreen.withOpacity(.1)),
                                        ),
                                      ),
                                      Column(
                                        children: controller.ProdctList.map(
                                            (e) => RadioListTile(
                                                  activeColor: myGreen,
                                                  title: Text(
                                                    "${e.name}",
                                                    style: TextStyle(
                                                        color: myOrange,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  groupValue: e
                                                      .id, //controller.radioId.value,
                                                  value: controller
                                                      .radioId.value, //e.id,
                                                  onChanged: (val) {
                                                    controller
                                                        .changeRadioButton(e);
                                                  },
                                                )).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: MyAddTextField(
                controller: controller.couponCode,
                obcure: false,
                label: "Coupon Code".tr,
                // validate: ((p0) {
                //   return validInput(p0!, 1, 10, "number");
                // }),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(1.h),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white, //background color of dropdown button
                      border: Border.all(
                          color: myOrange,
                          width: 2), //border of dropdown button
                      borderRadius: BorderRadius.circular(
                          15), //border raiuds of dropdown button
                      boxShadow: <BoxShadow>[
                        //apply shadow on Dropdown button
                        BoxShadow(
                            color: myOrange,
                            blurRadius: 0.1), //shadow for button
                      ]),
                  child: DropdownButton(
                    isExpanded: true,
                    autofocus: true,
                    dropdownColor: myWhite,
                    focusColor: myOrange,
                    // isExpanded: true,
                    underline: const SizedBox(),
                    elevation: 2,
                    hint: Center(
                      child: controller.discountSelect.value == ""
                          ? Padding(
                              padding: EdgeInsets.all(1.h),
                              child: Text(
                                "dic".tr,
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            )
                          : Text(
                              controller.discountSelect.value,
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
                    items: controller.discountTypeList
                        .map<DropdownMenuItem<CateogryItems>>(
                            (cat) => DropdownMenuItem(
                                  value: cat,
                                  child: Center(
                                    child: Text(cat.name!),
                                  ),
                                ))
                        .toList(),
                    onChanged: ((value) {
                      controller.changeSelectDiscount(value);
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
            ),
            Padding(
              padding: EdgeInsets.all(.5.h),
              child: Row(
                children: [
                  MySmallTextField(
                    controller: controller.discount,
                    type: TextInputType.number,
                    obcure: false,
                    label: "Discount".tr,
                    validate: ((p0) {
                      return validInput(p0!, 1, 10, "number");
                    }),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Discount Date Rang".tr,
                  ),
                  const DateCoupon(),
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
                        "${"start".tr}       ${controller.startDate.value}",
                        style: TextStyle(
                            color: myGreen,
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
                            color: myGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => BlueButton(
                  onpress: () async {
                    FocusScope.of(context).unfocus();
                    await controller.createCoupon(catId: 1);
                  },
                  title: controller.isLoading.value ==false
                      ? Text("Save".tr,
                          style: TextStyle(
                              color: myWhite, fontWeight: FontWeight.bold))
                      : SpinKitDualRing(color: myOrange, size: 20.sp),
                  hight: 5.h,
                  width: 100.w),
            )
          ]),
        ),
      ),
    );
  }
}
