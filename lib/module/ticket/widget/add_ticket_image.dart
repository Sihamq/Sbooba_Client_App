import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/ticket/widget/ticket_controller.dart';
import 'package:sizer/sizer.dart';

import '../../my_colors.dart';
import '../../shared/component/green_button.dart';

class TicketImage extends StatelessWidget {
  const TicketImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TicketController>(
        init: TicketController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white, //background color of dropdown button
                  border: Border.all(
                      color: Colors.grey[200]!,
                      width: 3), //border of dropdown button
                  borderRadius: BorderRadius.circular(
                      30), //border raiuds of dropdown button
                  boxShadow: <BoxShadow>[
                    //apply shadow on Dropdown button
                    BoxShadow(
                        color: myGreen, blurRadius: 0.1), //shadow for button
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
                                    child: Image.file(File(controller
                                        .imageFileList[itemIndex].path)))
                                : Text("No choose any image"),
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
                          child: Text("select",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                              )),
                        ),
                      ),
                    ),
                    Text("You Choose${controller.imageFileList.length}")
                  ],
                ),
              ),
            ));
  }
}
