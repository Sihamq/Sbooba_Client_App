import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/Profile/widgets/profile_card.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/add_product/add_product_order.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/products/widget/cate_card.dart';
import 'package:sizer/sizer.dart';

import 'add_product/add_product_view.dart';

class ProductCateogries extends GetView<ProductController> {
  const ProductCateogries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGreen,
      appBar: AppBar(
        iconTheme: IconThemeData(color: myWhite),
        title: Text(
          "ch".tr,
          style: TextStyle(fontWeight: FontWeight.bold, color: myWhite),
        ),
        elevation: 0,
        backgroundColor: myGreen,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(1.h),
              child: Tooltip(
                enableFeedback: true,
                message: "o2".tr,
                child: CateogryCard(
                  onTap: () => Get.to(() => AddProduct()),
                  iconData: "assets/pro.png",
                  text: "every".tr,
                ),
              ),
            ),
            SizedBox(
              width: 10.h,
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: Tooltip(
                enableFeedback: true,
                message: "o".tr,
                child: InkWell(
                  onTap: () => {Get.to(() => AddProductOrder())},
                  child: CateogryCard(
                      iconData: "assets/time.png", text: "orderss".tr),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
