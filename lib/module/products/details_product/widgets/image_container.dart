import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/models/show_product.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/module/shared/routes/api_routes.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageContainer extends GetView<ProductController> {
  var pageController = PageController();
  ShowItem? showItem;
  ImageContainer({super.key, this.showItem});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProductController(),
        builder: (controller) => (Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .35,
                    // width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        //shape: BoxShape.circle
                        ),
                    child: controller.showProduct.isNotEmpty
                        ? PageView.builder(
                            allowImplicitScrolling: true,
                            controller: pageController,
                            itemCount:
                                controller.showProduct[0].attachment!.length,
                            itemBuilder: (context, index) =>
                                controller.showProduct[0].attachment!.isNotEmpty
                                    ? Container(
                                        decoration: BoxDecoration(),
                                        // image: DecorationImage(
                                        //  fit: BoxFit.cover,
                                        child: CachedNetworkImage(
                                          imageUrl: ApiLink.storeageImage +
                                              controller.showProduct[0]
                                                  .attachment![index],
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            "assets/sh.png",
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                        //  NetworkImage(
                                        //   ApiLink.storeageImage +
                                        //       controller.showProduct[0]
                                        //           .attachment![index],
                                        // ),
                                        //  )
                                        )
                                    : Center(
                                        child: SpinKitFadingCube(
                                        color: myOrange,
                                      )),
                          )
                        : Center(
                            child: SpinKitFadingCube(
                            color: myOrange,
                          )),
                  ),
                ),
                // Positioned(
                //   bottom: 45.w,
                //   left: 2.h,
                //   child: InkWell(
                //     onTap: () => {
                //       // controller.getProducts().then(
                //       //       (value) => navigator!.pop(),
                //       //     ),

                //       // controller.getProducts().then(
                //       //       (value) =>
                //       navigator!.pop(),
                //       //  ),
                //     },
                //     child: Container(
                //       height: 12.h,
                //       width: 4.h,
                //       color: Colors.transparent,
                //       child: Icon(
                //         CashHelper.getData("lang") == "ar"
                //             ? Icons.arrow_forward_ios
                //             : Icons.arrow_back_ios,
                //         color: myOrange,
                //         size: 20.sp,
                //       ),
                //     ),
                //   ),
                // ),
                PositionedDirectional(
                  bottom: 45.w,
                  start: 2.h,
                  child: InkWell(
                    onTap: () => {
                      // controller.getProducts().then(
                      //       (value) => navigator!.pop(),
                      //     ),

                      // controller.getProducts().then(
                      //       (value) => navigator!.pop(),
                      //     ),
                      navigator!.pop(),
                    },
                    child: Container(
                      height: 12.h,
                      width: 4.h,
                      color: Colors.transparent,
                      child: Icon(
                        // CashHelper.getData("lang") == "ar"
                        // ?
                        Icons.arrow_back_ios,
                        //Icons.arrow_forward_ios,
                        // : Icons.arrow_back_ios,
                        color: myOrange,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: SmoothPageIndicator(
                    effect: ScrollingDotsEffect(
                      dotHeight: 15,
                      dotWidth: 15,
                      activeDotColor: myGreen,
                      spacing: 20,
                      dotColor: myWhite,
                    ),
                    controller: pageController,
                    count: controller.showProduct.isEmpty
                        ? 1
                        : controller.showProduct[0].attachment!.length,
                  ),
                ),
              ],
            )));
  }
}
