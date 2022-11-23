import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/coupons/add_coupons/add_coupons_view.dart';
import 'package:sboba_app_client/module/coupons/coupons_controller.dart';
import 'package:sboba_app_client/module/coupons/widget/coupon_container.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

import '../products/widget/adding_container.dart';

class CouponsView extends GetView<CouponsController> {
  const CouponsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CouponsController());
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
            child: controller.couponItem.isNotEmpty
                ? Obx(
                    () => ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.couponItem.length,
                        itemBuilder: (context, index) {
                          return HorizontalCouponExample2(index: index);
                        }),
                  )
                : SkeletonListView(),
          ),
          SizedBox(
            height: 1.h,
          )
        ]),
      ),
    );
  }
}
