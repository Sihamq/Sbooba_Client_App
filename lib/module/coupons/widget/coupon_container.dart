import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class HorizontalCouponExample2 extends StatelessWidget {
  const HorizontalCouponExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromARGB(255, 252, 248, 248);
    const Color secondaryColor = Color.fromARGB(255, 114, 142, 113);

    return Padding(
      padding: EdgeInsets.all(1.h),
      child: CouponCard(
        // width: 20.w,
        height: 18.h,
        backgroundColor: primaryColor,
        clockwise: true,
        curvePosition: 135,
        curveRadius: 30,
        curveAxis: Axis.vertical,
        borderRadius: 10,
        firstChild: Container(
            width: 20.h,
            decoration: const BoxDecoration(
              color: secondaryColor,
            ),
            child: Center(
              child: Text(
                "65765765",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
            )),
        secondChild: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(1.h),
          child: Column(
            //  mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Product Base',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 2.5.h,
                  ),
                  InkWell(
                      child: Icon(
                    Icons.edit,
                    color: myGreen,
                  )),
                  Icon(Icons.more_vert),
                  InkWell(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red[900],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 1.w,
              ),
              Row(
                children: [
                  Text(
                    "Discount".tr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    "${10.1}",
                    style: TextStyle(color: myOrange),
                  ),
                  Icon(
                    MdiIcons.ticket,
                    color: myOrange,
                    size: 5.w,
                  )
                ],
              ),
              Spacer(),
              Wrap(
                spacing: 1.w,
                children: [
                  Text(
                    "Start Date".tr,
                    style: TextStyle(color: myOrange, fontSize: 8.sp),
                  ),
                  Text(
                    "29-3-2022",
                    style: TextStyle(color: myGreen, fontSize: 8.sp),
                  ),
                  Text(
                    "End Date".tr,
                    style: TextStyle(color: myOrange, fontSize: 8.sp),
                  ),
                  Text(
                    "29-3-2022",
                    style: TextStyle(color: myGreen, fontSize: 8.sp),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
