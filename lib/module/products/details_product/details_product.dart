import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/models/show_product.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/details_product/widgets/details_container.dart';
import 'package:sboba_app_client/module/products/details_product/widgets/image_container.dart';
import 'package:sizer/sizer.dart';

import '../product_controller.dart';

class DetailsProduct extends StatelessWidget {
  int? index;
  ShowItem? showItem;
  DetailsProduct({super.key, this.index, this.showItem});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) => Scaffold(
        backgroundColor: myGreen,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(//alignment: AlignmentDirectional.bottomEnd,
                children: [
              ImageContainer(),
              DetailsContainer(
                index: index,
                showItem: showItem,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
