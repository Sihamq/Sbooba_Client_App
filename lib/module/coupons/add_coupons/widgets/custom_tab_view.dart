import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/coupons/coupons_controller.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/date_container.dart';
import 'package:sboba_app_client/module/shared/component/add_text_formfield.dart';
import 'package:sboba_app_client/module/shared/component/small_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../../my_colors.dart';
import '../../../shared/component/green_button.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<CouponsController>(
        init: CouponsController(),
        builder: (controller) => Column(children: [
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                controller: controller.couponCode,
                obcure: false,
                label: "Coupon Code".tr),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: MyAddTextField(
              controller: controller.disountType,
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
                    controller: controller.discount,
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
              title: Text("Save".tr,
                  style:
                      TextStyle(color: myWhite, fontWeight: FontWeight.bold)),
              hight: 5.h,
              width: 100.w)
        ]),
      ),
    );
  }
}
