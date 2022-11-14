import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/coupons/add_coupons/widgets/custom_tab_view.dart';
import 'package:sboba_app_client/module/coupons/add_coupons/widgets/custom_total_bar_view.dart';
import 'package:sboba_app_client/module/my_colors.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    TabController? tabController;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
              controller: tabController,
              unselectedLabelColor: myBlack,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: myGreen),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey[300]!, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Product Base".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey[300]!, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Total".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                TabBarView(children: [CustomTabView(), CustomTabOrderView()]),
          )),
        ],
      ),
    );
  }
}
