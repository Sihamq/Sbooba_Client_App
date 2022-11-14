import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/coupons/add_coupons/add_coupons_view.dart';
import 'package:sboba_app_client/module/coupons/widget/coupon_container.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

import '../products/widget/adding_container.dart';

class CouponsView extends StatelessWidget {
  const CouponsView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(children: [
        AddingContainer(
          btnTitle: "Add coupons".tr,
          label: "Coupons Count".tr,
          noOfPro: 5,
          onTap: (() {
            Get.to(() => AddCoupons());
          }),
        ),
        //HorizontalCouponExample2()
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //     childAspectRatio: 5 / 2,
              //     maxCrossAxisExtent: 100,
              //     mainAxisSpacing: 100,
              //     crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return HorizontalCouponExample2();
              }),
        ),
        SizedBox(
          height: 1.h,
        )
      ]),
    );
  }
}
