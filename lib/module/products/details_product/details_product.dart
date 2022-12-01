import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/details_product/widgets/details_container.dart';
import 'package:sboba_app_client/module/products/details_product/widgets/image_container.dart';
import 'package:sizer/sizer.dart';

import '../product_controller.dart';

class DetailsProduct extends StatelessWidget {
  int? index;
  DetailsProduct({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) => Scaffold(
        backgroundColor: myGreen,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(//alignment: AlignmentDirectional.bottomEnd,
                children: [
              ImageContainer(),
              DetailsContainer(
                index: index,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
