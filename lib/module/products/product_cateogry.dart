import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/Profile/widgets/profile_card.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/products/widget/cate_card.dart';
import 'package:sizer/sizer.dart';

import 'add_product/add_product_view.dart';

class ProductCateogries extends GetView<ProductController> {
  const ProductCateogries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CateogryCard(
                    onTap: () => Get.to(() => AddProduct()),
                    iconData: "assets/pro.png",
                    text: "منتجات يومية",
                  ),
                  SizedBox(
                    width: 4.h,
                  ),
                  InkWell(
                    onTap: () => {},
                    child: CateogryCard(
                        iconData: "assets/time.png", text: "طلبات وعزائم"),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
