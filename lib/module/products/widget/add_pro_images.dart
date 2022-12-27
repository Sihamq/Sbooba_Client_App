import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sizer/sizer.dart';

class AddProImages extends StatelessWidget {
  var proControoler = Get.put(ProductController);
  AddProImages({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) => DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, //background color of dropdown button
            border: Border.all(
                color: Colors.grey[200]!, width: 3), //border of dropdown button
            borderRadius:
                BorderRadius.circular(30), //border raiuds of dropdown button
            boxShadow: <BoxShadow>[
              //apply shadow on Dropdown button
              BoxShadow(color: myGreen, blurRadius: 0.1), //shadow for button
            ]),
        child: Padding(
          padding: EdgeInsets.all(1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 12.h,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                  ),
                  itemCount: controller.imageFileList.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      controller.imageFileList.isNotEmpty
                          ? Container(

                              // Image(image: AssetImage("assets/pp.png",
                              child: Image.file(File(
                                  controller.imageFileList[itemIndex].path)))
                          : Text(
                              "choose".tr,
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(.6),
                                  fontWeight: FontWeight.bold),
                            ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.h),
                child: Container(
                  width: 12.h,
                  height: 4.h,
                  decoration: BoxDecoration(
                      color: myGreen,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    //minWidth: 10.h,
                    onPressed: () async {
                      controller.selectImages(context);
                    },
                    child: Text("select".tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp,
                        )),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "YouChoose".tr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${controller.imageFileList.length}")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
