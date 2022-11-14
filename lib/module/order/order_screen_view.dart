import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/order/details_order/details_order.dart';
import 'package:sboba_app_client/module/order/order_controller.dart';
import 'package:sboba_app_client/module/order/widgets/grid_view.dart';
import 'package:sboba_app_client/module/order/widgets/pending_card.dart';
import 'package:sizer/sizer.dart';

import '../my_colors.dart';

class OrderView extends StatelessWidget {
  TabController? controlle;
  OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
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
        Padding(
          padding: EdgeInsets.all(2.h),
          child: Container(
            width: 48.h,
            height: 6.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //     childAspectRatio: 5 / 2,
                //     maxCrossAxisExtent: 100,
                //     mainAxisSpacing: 100,
                //     crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return GridProduct(
                    index: index,
                  );
                }),
          ),
        ),
        Expanded(
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 2 / 2,
                  maxCrossAxisExtent: 350,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: ((context, index) => InkWell(
                  onTap: (() => Get.to(() => DetailsOrder())),
                  child: PendingCard())),
              itemCount: 5),
        ),
      ]),
    );
  }
}
