import 'package:awesome_dialog/awesome_dialog.dart';
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
import '../../shared/component/awesome_dialog.dart';

class MealCard extends GetView<ProductController> {
  int? index;
  MealCard({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.topRight, children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    CustomeAwesomeDialog().AwesomeDialogHeader(
                        DialogType: DialogType.question,
                        context: context,
                        describe: "",
                        subTitle: "Do you want to delete  this Product?",
                        mainTitle: "",
                        btOnpressed: () => controller
                            .deleteProducts(controller.productItem[index!].id));
                  },
                  child: Icon(
                    Icons.cancel_outlined,
                    color: myOrange,
                    size: 20.sp,
                  ),
                ),
              ),
              CachedNetworkImage(
                imageUrl: controller.productItem[index!].category!.icon!,
                imageBuilder: (context, imageProvider) => Container(
                  //
                  //
                  //
                  width: 120.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => SpinKitCircle(color: myGreen),
                errorWidget: (context, url, error) => Center(
                    child: Container(
                        height: 7.h,
                        child: const Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/121.png",
                            )))),
              ),
              if (controller.productItem[index!].tax != 0) DiscountContainer(),
            ]),
            Padding(
              padding: EdgeInsets.all(.5.h),
              child: Text(
                controller.productItem[index!].name!,
                style: TextStyle(
                    color: myGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.w, right: 1.w),
              child: Wrap(spacing: 1.w, children: [
                Text(
                  controller.productItem[index!].unitPrice.toString() +
                      "SAR".tr,
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                      color: myOrange),
                ),
                Icon(
                  Icons.discount_rounded,
                  color: myGreen,
                  size: 4.w,
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.w, right: 1.w),
              child: Wrap(
                spacing: 2.w,
                children: [
                  Text(
                    "EndDate".tr,
                    style:
                        TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                  ),
                  Text("22-Novmber-2022",
                      style: TextStyle(
                          fontSize: 8.sp, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            const Spacer(),
            Container(
                color: myGreen.withOpacity(.1),
                height: 3.h,
                width: 100.w,
                child: RatingBarIndicator(
                  rating: 3.75,
                  itemBuilder: (context, index) => Icon(
                    Icons.star_border_outlined,
                    color: myOrange,
                  ),
                  itemCount: 1,
                  itemSize: 12.5.w,
                  direction: Axis.horizontal,
                ))
          ],
        ),
      ),
    );
  }
}
