import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/products/widget/discount_container.dart';
import 'package:sizer/sizer.dart';

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
        //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                    height: 12.h,
                    width: 100.w,
                    child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/pp.jpg",
                        ))),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: InkWell(
                    onTap: () {
                      CustomeAwesomeDialog().AwesomeDialogHeader(
                          DialogType: DialogType.question,
                          context: context,
                          describe: "",
                          subTitle: "deletep".tr,
                          mainTitle: "",
                          btOnpressed: () => controller.deleteProducts(
                              controller.productItem[index!].id));
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: myOrange,
                      size: 20.sp,
                    ),
                  ),
                ),
                if (controller.productItem[index!].tax != 0)
                  Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: DiscountContainer()),
              ]),
              Padding(
                padding: EdgeInsets.all(.5.h),
                child: Text(
                  controller.productItem[index!].name!,
                  style: TextStyle(
                      color: myGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.w, right: 1.w),
                child: Wrap(spacing: 1.w, children: [
                  Text(
                    "price".tr,
                    style: TextStyle(
                        color: myGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp),
                  ),
                  Text(
                    controller.productItem[index!].unitPrice.toString() +
                        "SAR".tr,
                    style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold,
                        color: myOrange),
                  ),
                ]),
              ),
              if (controller.productItem[index!].tax != 0)
                Padding(
                  padding: EdgeInsets.only(
                    left: 1.w,
                    right: 1.w,
                  ),
                  child: Wrap(
                    spacing: 2.w,
                    children: [
                      Icon(
                        Icons.discount_rounded,
                        color: myGreen,
                        size: 5.w,
                      ),
                      Text(
                        "EndDate".tr,
                        style: TextStyle(
                            fontSize: 8.sp, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
