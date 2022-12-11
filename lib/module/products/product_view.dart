import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sboba_app_client/module/products/add_product/add_product_view.dart';
import 'package:sboba_app_client/module/products/details_product/details_product.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/products/widget/add_button.dart';
import 'package:sboba_app_client/module/products/widget/adding_container.dart';
import 'package:sboba_app_client/module/shared/component/empty_screen.dart';
import 'package:sboba_app_client/module/products/widget/meal_type_card.dart';
import 'package:sboba_app_client/module/products/widget/product_cateogry.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

import '../my_colors.dart';
import '../order/widgets/grid_view.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    controller.getProducts();
    controller.getCateogries();

    print("product");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Icon(
                Icons.search,
                color: myWhite,
              ),
            ),
          )
        ],
        backgroundColor: myGreen,
        leading: Padding(
          padding: EdgeInsets.all(1.h),
          child: const Image(image: AssetImage("assets/1.png")),
        ),
        elevation: 0,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(2.h),
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => SizedBox(
                // width: ,
                height: 6.h,
                child: controller.productCateogry.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              width: 1.5.h,
                            ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          print(controller.productCateogry.length);
                          return ProductCateogry(
                            x: index,
                          );
                        })
                    : SpinKitPouringHourGlassRefined(
                        color: myOrange, size: 30.sp)),
          ),
        ),
        Obx(
          () => AddingContainer(
            btnTitle: "Add Product".tr,
            label: "Add Last".tr,
            noOfPro: controller.productItem.value.length.toDouble(),
            onTap: (() {
              Get.to(() => AddProduct());
            }),
          ),
        ),
        Expanded(
          child: controller.obx(
            (state) => Padding(
              padding: EdgeInsets.all(1.h),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2 / 2,
                    maxCrossAxisExtent: 320,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 3),
                itemBuilder: ((context, index) => InkWell(
                    onTap: (() => {
                          controller
                              .showProducst(controller.productItem[index].id)
                              .then((value) => {
                                    Get.to(() => DetailsProduct(
                                          index: index,
                                        )),
                                    print("index is ${index}")
                                  })
                        }),
                    child: MealCard(
                      index: index,
                    ))),
                itemCount: controller.productItem.length,
              ),
            ),
            onEmpty: EmptyProduct(
              img: "assets/nopro.png",
              text: "noproduct".tr,
            ),
            onLoading: SpinKitPouringHourGlassRefined(
              strokeWidth: 5.0,
              color: myOrange,
              size: 80.sp,
              //duration: const Duration(milliseconds: 800)
            ),
            onError: (error) => SpinKitPouringHourGlassRefined(
              color: myOrange,
              size: 80.sp,
              // duration: const Duration(milliseconds: 800)
            ),
          ),
        ),
      ]),
    );
  }
}
