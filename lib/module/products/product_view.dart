import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/products/add_product/add_product_view.dart';
import 'package:sboba_app_client/module/products/details_product/details_product.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/products/widget/add_button.dart';
import 'package:sboba_app_client/module/products/widget/adding_container.dart';
import 'package:sboba_app_client/module/products/widget/empty_product.dart';
import 'package:sboba_app_client/module/products/widget/meal_type_card.dart';
import 'package:sboba_app_client/module/products/widget/product_cateogry.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

import '../my_colors.dart';
import '../order/widgets/grid_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            color: myGreen,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            child: Icon(
              Icons.search,
              color: myWhite,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: myGreen,
        leading: Padding(
          padding: EdgeInsets.all(1.h),
          child: Image(image: AssetImage("assets/1.png")),
        ),
        elevation: 0,
      ),
      body: GetBuilder<ProductController>(
        init: ProductController(),
        builder: (controller) => Column(children: [
          Padding(
            padding: EdgeInsets.all(2.h),
            child: Container(
                width: 48.h,
                height: 6.h,
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          width: 1.5.h,
                        ),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ProductCateogry(
                        x: index,
                      );
                    })),
          ),
          AddingContainer(
            btnTitle: "Add Product".tr,
            label: "Add Last".tr,
            noOfPro: 5,
            onTap: (() {
              Get.to(() => AddProduct());
            }),
          ),
          Expanded(
              child: controller.productItem.isNotEmpty
                  ? GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 2 / 2,
                              maxCrossAxisExtent: 210,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5),
                      itemBuilder: ((context, index) => InkWell(
                          onTap: (() => {
                                controller
                                    .showProducst(
                                        controller.product!.data![index].id)
                                    .then(
                                      (value) => Get.to(() => DetailsProduct(
                                            index: index,
                                          )),
                                    )
                              }),
                          child: MealCard(
                            index: index,
                          ))),
                      itemCount: controller.product!.data!.length,
                    )
                  : SkeletonListView()),
        ]),
      ),
    );
  }
}
