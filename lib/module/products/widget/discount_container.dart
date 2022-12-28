import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/get_product_model.dart';
import '../../my_colors.dart';

class DiscountContainer extends StatelessWidget {
  GetProductItem?
  productItem;
  int? index;

  DiscountContainer({super.key, this.productItem, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) => Container(
          width: 13.w,
          height: 6.w,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.redAccent[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: Wrap(children: [
            Text(
              productItem!.discount![0].discount.toString(),
              style: TextStyle(color: myWhite, fontWeight: FontWeight.w600),
            ),
            productItem!.discount![0].discountType == "1"
                ? Text(
                    "%",
                    style:
                        TextStyle(color: myWhite, fontWeight: FontWeight.w600),
                  )
                : Text(
                    "SAR".tr,
                    style:
                        TextStyle(color: myWhite, fontWeight: FontWeight.w600),
                  )
          ]))),
    );
  }
}
