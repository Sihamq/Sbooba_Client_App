import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/order/details_order/widgets/client_details.dart';
import 'package:sboba_app_client/module/order/details_order/widgets/meals_container.dart';
import 'package:sboba_app_client/module/order/details_order/widgets/order_btn.dart';
import 'package:sboba_app_client/module/products/details_product/widgets/details_container.dart';
import 'package:sboba_app_client/module/shared/dot_line.dart';
import 'package:sizer/sizer.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: myWhite),
        elevation: 0,
        //  actionsIconTheme: IconThemeData(color: myWhite),
        backgroundColor: myGreen,
        title: Text("Order Details".tr,
            style: TextStyle(fontWeight: FontWeight.bold, color: myWhite)),
      ),
      body: SingleChildScrollView(
        child: Stack(alignment: AlignmentDirectional.center, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.all(1.h),
              child: Row(
                children: [
                  Text("#7678678678"),
                  Spacer(),
                  OrderButton(
                      color: myOrange, text: "Pending".tr, pressed: () {})
                ],
              ),
            ),
            Wrap(
              spacing: 2.w,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Icon(
                  Icons.calendar_month,
                  color: myOrange,
                  size: 20,
                ),
                Text("24-3-2022", style: TextStyle(fontSize: 8.sp)),
                Icon(
                  Icons.av_timer,
                  color: myOrange,
                  size: 20,
                ),
                Text("10:00 PM", style: TextStyle(fontSize: 8.sp))
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 1.h, bottom: 1.h, left: 3.h, right: 3.h),
              child: MySeparator(),
            ),
            ClientDetails(
              apartNo: "apartment",
              city: "The city",
              colorContainer: myWhite,
              buildingName: "buildName",
              floorNo: "FloorNo",
              nearTo: "nearTo",
              region: "The region",
              street: "the street",
              titleContainer: "Client".tr,
              email: "Siham@gmail.com",
              name: "Siham",
              phone: "96612345",
              icon: Icons.phone,
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.h, right: 1.h),
              child: Row(
                children: [
                  Text(
                    "Meals ...................".tr,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    "${15} Items".tr,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 30.h,
              child: ListView.separated(
                  //  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return MealsPartContainer(
                      mealName: "Pizza",
                      noOrder: "5",
                      price: 8000,
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return SizedBox(height: 1.h);
                  }),
                  itemCount: 5),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 1.h, right: 1.h),
              child: Card(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Row(
                      children: [
                        Text(
                          "Total Price ".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 11.sp),
                        ),
                        Spacer(),
                        Text(
                          "${800.0}SAR".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 11.sp),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Row(
                      children: [
                        Text(
                          "Payment Method".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 11.sp),
                        ),
                        Spacer(),
                        Text(
                          "Cash".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 11.sp),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          minWidth: 17.h,
                          onPressed: () {},
                          child: Text(
                            "Accept".tr,
                            style: TextStyle(
                                color: myWhite, fontWeight: FontWeight.bold),
                          ),
                          color: myGreen),
                      SizedBox(width: 2.h),
                      MaterialButton(
                        minWidth: 17.h,
                        onPressed: () {},
                        child: Text(
                          "Cancel".tr,
                          style: TextStyle(
                              color: myWhite, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ]),
                elevation: 5,
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
