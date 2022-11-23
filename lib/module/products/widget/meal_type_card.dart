import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/models/product_model.dart';
import 'package:sboba_app_client/module/products/product_binding.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/products/widget/discount_container.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../my_colors.dart';

class MealCard extends StatelessWidget {
  int? index;
  MealCard({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) => Stack(
        alignment: Alignment.topRight,
        children: [
          Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.h)),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: controller.product!.data![index!].category!.icon!,
                    imageBuilder: (context, imageProvider) => Container(
                      //
                      //
                      //
                      width: 120.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) =>
                        SpinKitCircle(color: myGreen),
                    errorWidget: (context, url, error) => Padding(
                      padding: EdgeInsets.all(3.h),
                      child: Center(
                          child: Icon(
                        Icons.error,
                        color: myGreen,
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(.5.h),
                    child: Text(
                      controller.product!.data![index!].name!,
                      style: TextStyle(
                          color: myGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 1.w, right: 1.w),
                    child: Wrap(spacing: 2.w, children: [
                      Text(
                        controller.product!.data![index!].unitPrice.toString(),
                        style: TextStyle(
                            fontSize: 8.sp, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.discount_rounded,
                        color: myGreen,
                        size: 4.w,
                      ),
                      Text(
                        "EndDate".tr,
                        style: TextStyle(
                            fontSize: 8.sp, fontWeight: FontWeight.bold),
                      ),
                      Text("22-10-2022",
                          style: TextStyle(
                              fontSize: 8.sp, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  Spacer(),
                  Container(
                      color: myGreen.withOpacity(.1),
                      height: 4.h,
                      width: 100.w,
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: RatingBarIndicator(
                          rating: 3.75,
                          itemBuilder: (context, index) => Icon(
                            Icons.star_border_outlined,
                            color: myOrange,
                          ),
                          itemCount: 1,
                          itemSize: 13.5.w,
                          direction: Axis.horizontal,
                        ),
                      ))
                ],
              )),
          if (controller.product!.data![index!].tax != 0) DiscountContainer(),
        ],
      ),
    );
  }
}
