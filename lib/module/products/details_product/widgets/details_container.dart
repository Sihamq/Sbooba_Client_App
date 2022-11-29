import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sizer/sizer.dart';

class DetailsContainer extends StatelessWidget {
  int? index;
  DetailsContainer({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    print("index:$index");
    return GetBuilder<ProductController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .60,
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
              color: myGreen,
              width: 7.0,
            )),
            color: Colors.white,

            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Row(
                      children: [
                        Text(
                          controller.showProduct[index!].name!.en!,
                          style: TextStyle(
                              color: Colors.black,
                              wordSpacing: 3,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 12.h,
                        ),
                        Container(
                            width: 22.w,
                            height: 3.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: myGreen.withOpacity(.3)),
                            child: Center(
                              child: Text(
                                "Sweets",
                                style: TextStyle(
                                    color: Colors.black,
                                    wordSpacing: 3,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                  ),

                  Wrap(
                    spacing: 3.w,
                    children: [
                      Text(
                        "${100.0}SAR".tr,
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 8.sp),
                      ),
                      Text(
                        "${10.0}",
                        style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                            color: myGreen),
                      ),
                      Icon(
                        MdiIcons.ticket,
                        size: 2.h,
                        color: myGreen,
                      ),
                      Text(
                        "Date".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 8.sp),
                      ),
                      Text(
                        "${100.0}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 8.sp),
                      ),
                    ],
                  ),

                  Text(
                    controller.showProduct[index!].unitPrice.toString() +
                        "SAR".tr,
                    //"${140} SAR".tr,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: myOrange,
                        fontWeight: FontWeight.bold),
                    maxLines: 3,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Wrap(
                      spacing: 3.w,
                      children: [
                        Text("${1} Large".tr,
                            style: TextStyle(
                                color: Colors.black,
                                wordSpacing: 3,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold)),
                        Icon(Icons.more_vert),
                        Text(
                            "${controller.showProduct[index!].calories} Calories"
                                .tr,
                            style: TextStyle(
                                color: Colors.black,
                                wordSpacing: 3,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Text("Description/Ingredient".tr,
                      style: TextStyle(
                          color: Colors.black,
                          wordSpacing: 3,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold)),

                  Text(
                    controller.showProduct[index!].descriptionName!.en!,
                    //"The menu has been called “a map that encourages easy navigation between hunger and satisfaction.” Mouthwatering restaurant menu descriptions can make your clients crave your offerings and happy patrons come back many times.",
                    style: TextStyle(
                        color: Colors.grey[700],
                        height: 2,
                        fontWeight: FontWeight.bold),
                    maxLines: 5,
                  ),
                  Text("Tags".tr,
                      style: TextStyle(
                          color: Colors.black,
                          wordSpacing: 3,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Wrap(
                      spacing: 2.w,
                      children: [
                        Chip(
                          padding: EdgeInsets.only(left: 2.h, right: 2.h),
                          label: Text(
                            "Tag",
                            style: TextStyle(
                                color: Colors.grey[500],
                                wordSpacing: 3,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: myGreen.withOpacity(.1),
                        ),
                        Chip(
                          padding: EdgeInsets.only(left: 2.h, right: 2.h),
                          label: Text(
                            "Tag",
                            style: TextStyle(
                                color: Colors.grey[500],
                                wordSpacing: 3,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: myGreen.withOpacity(.1),
                        ),
                        Chip(
                          padding: EdgeInsets.only(left: 3.h, right: 3.h),
                          label: Text(
                            "Tag".tr,
                            style: TextStyle(
                                color: Colors.grey[500],
                                wordSpacing: 3,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: myGreen.withOpacity(.1),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Text(
                          "Published".tr,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: myGreen,
                        child: CircleAvatar(
                            radius: 10,
                            child: Center(
                                child:
                                    controller.showProduct[index!].published ==
                                            1
                                        ? Icon(
                                            Icons.done,
                                            size: 5.w,
                                          )
                                        : Icon(
                                            Icons.cancel,
                                            size: 5.w,
                                          ))),
                      )
                      // Switch(
                      //       focusColor: myOrange,
                      //       value: controller.swittch.value,
                      //       onChanged: (value) {
                      //         controller.changSwitch(
                      //             controller.showProduct[index!].published);
                      //       },
                      //       activeColor: myOrange,
                      //       inactiveThumbColor: Colors.grey,
                      //     )
                    ]),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Text(
                          "Featured".tr,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: myGreen,
                        child: CircleAvatar(
                            radius: 10,
                            child: Center(
                                child:
                                    controller.showProduct[index!].featured == 1
                                        ? Icon(
                                            Icons.done,
                                            size: 5.w,
                                          )
                                        : Icon(
                                            Icons.cancel,
                                            size: 5.w,
                                          ))),
                      )
                      // Switch(
                      //       focusColor: myOrange,
                      //       value: controller.swittch.value,
                      //       onChanged: (value) {
                      //         controller.changSwitch(
                      //             controller.showProduct[index!].published);
                      //       },
                      //       activeColor: myOrange,
                      //       inactiveThumbColor: Colors.grey,
                      //     )
                    ]),
                  ),

                  // Container(
                  //   color: Colors.grey[200],
                  //   child: Row(children: [
                  //     Padding(
                  //       padding: EdgeInsets.all(1.h),
                  //       child: Text("Featured".tr,
                  //           style: TextStyle(fontWeight: FontWeight.bold)),
                  //     ),
                  //     Spacer(),
                  //     // Obx(
                  //     //   () => Switch(
                  //     //     onChanged: (value) {
                  //     //       controller.changeFeaturedswitch(
                  //     //           controller.showProduct[index!].featured);
                  //     //     },
                  //     //     value: controller.featured.value,
                  //     //     // onChanged: ((value) {

                  //     //     // }),
                  //     //     activeColor: myOrange,
                  //     //     inactiveThumbColor: Colors.grey,
                  //     //   ),
                  //     // )
                  //   ]),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                            minWidth: 17.h,
                            onPressed: () {},
                            child: Text(
                              "Edit".tr,
                              style: TextStyle(
                                  color: myWhite, fontWeight: FontWeight.bold),
                            ),
                            color: myGreen),
                        SizedBox(width: 3.h),
                        MaterialButton(
                            minWidth: 17.h,
                            onPressed: () {},
                            child: Text(
                              "Cancel".tr,
                              style: TextStyle(
                                  color: myWhite, fontWeight: FontWeight.bold),
                            ),
                            color: Colors.grey),
                      ],
                    ),
                  )

                  // Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
