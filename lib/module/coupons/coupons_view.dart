import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/coupons/add_coupons/add_coupons_view.dart';
import 'package:sboba_app_client/module/coupons/coupons_controller.dart';
import 'package:sboba_app_client/module/coupons/widget/coupon_container.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/shared/component/empty_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

import '../products/widget/adding_container.dart';

class CouponsView extends GetView<CouponsController> {
  const CouponsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CouponsController());

    controller.getCoupons();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Icon(
              Icons.search,
              color: myWhite,
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
      body: GetBuilder<CouponsController>(
        init: CouponsController(),
        builder: (controller) => Column(children: [
          AddingContainer(
            btnTitle: "Add coupons".tr,
            label: "Coupons Count".tr,
            noOfPro: controller.couponItem.length.toDouble(),
            onTap: (() {
              Get.to(() => AddCoupons());
            }),
          ),
          //HorizontalCouponExample2()

          Expanded(
              child: controller.obx(
                  (state) => ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.couponItem.length,
                      itemBuilder: (context, index) {
                        return HorizontalCouponExample2(index: index);
                      }),
                  onEmpty:
                      EmptyProduct(img: "assets/box.png", text: "nocoupons".tr),
                  onLoading: SpinKitPouringHourGlassRefined(
                    color: myOrange,
                    size: 80.sp,
                    // duration: const Duration(milliseconds: 800)
                  ))),

          SizedBox(
            height: 1.h,
          )
        ]),
      ),
    );
  }
}
