import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

import 'home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({super.key});

  TabController? cont;
  Widget tabItem(String path, String label, {bool isSelected = false}) {
    Get.put(HomeController);
    return AnimatedContainer(
        height: 10.h,
        width: 46.w,
        margin: EdgeInsets.only(
          top: 2.h,
        ),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: myOrange,
              ),
        //padding: EdgeInsets.all(1.h),
        child: Center(
          child: Column(
            children: [
              ImageIcon(
                AssetImage(path),
                color: isSelected ? myGreen : myBlack,
              ),
              Expanded(
                child: Text(label.tr,
                    style: TextStyle(
                        fontSize: 6.5.sp,
                        color: isSelected ? myGreen : myBlack,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // Get.find();
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[200],
        bottomNavigationBar:
            // Container(
            //   height: 8.h,
            //   width: 45.w,
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
            Container(
                height: 10.h,
                // width: 15.w,
                padding: EdgeInsets.only(
                  bottom: 1.w,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      color: myWhite,
                      child: DefaultTabController(
                        length: 5,
                        // onTap: ((value) => controller.changCurrentIndex(value)),
                        // controller: cont,
                        child: TabBar(
                          onTap: ((value) =>
                              controller.changCurrentIndex(value)),
                          controller: cont,
                          tabs: [
                            for (int i = 0; i < controller.icon.length; i++)
                              tabItem(
                                controller.icon[i],
                                controller.label[i],
                                isSelected: i == controller.currentIndex,
                              ),
                          ],
                        ),
                      ),
                    ))),
        body: controller.list[controller.currentIndex],
      ),
    );
  }
}
