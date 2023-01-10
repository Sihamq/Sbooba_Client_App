import 'dart:ui';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/data/models/show_product.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/edit_product/edit_product_view.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/module/shared/component/small_text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class DetailsContainer extends StatelessWidget {
  int? index;
  ShowItem? showItem;
  DetailsContainer({super.key, this.index, this.showItem});

  @override
  Widget build(BuildContext context) {
    print("index:$index");
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) => Container(
        //width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .90,
        decoration: BoxDecoration(
          // borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(
          //       10,
          //     ),
          //     topRight: Radius.circular(10)),
          border: Border(
              top: BorderSide(
            color: myGreen,
            width: 7.0,
          )),
          color: Colors.white,

          // ),
        ),
        child: Padding(
            padding: EdgeInsets.all(1.h),
            child: controller.showProduct.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Text(
                          "details".tr,
                          style: TextStyle(
                              color: myGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Row(
                          children: [
                            Text(
                              CashHelper.getData("lang") == "en"
                                  ? controller.showProduct[0].name!.en!
                                  : controller.showProduct[0].name!.ar!,
                              style: TextStyle(
                                  color: myOrange,
                                  wordSpacing: 3,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 12.h,
                            ),
                            Container(
                                width: 30.w,
                                height: 4.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: myGreen.withOpacity(.3)),
                                child: Center(
                                  child: Text(
                                    controller.showProduct[0].cateogryName!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        // wordSpacing: 3,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      if (controller.showProduct[0].discountedPrice != 0)
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Wrap(
                            spacing: 3.w,
                            children: [
                              Text(
                                controller.showProduct[0].purchasePrice
                                        .toString() +
                                    "SAR".tr,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 8.sp),
                              ),
                              Text(
                                controller.showProduct[0].discount!.discount
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.bold,
                                    color: myGreen),
                              ),
                              if (controller
                                      .showProduct[0].discount!.discountType ==
                                  "1")
                                Text(
                                  "%",
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8.sp),
                              ),
                              Text(
                                DateFormat("yyyy-MM-dd")
                                    .format(controller.showProduct[0].discount!
                                        .discountEndDate!)
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8.sp),
                              ),
                            ],
                          ),
                        ),

                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Wrap(spacing: 5.w, children: [
                          Text(
                            "price".tr,
                            style: TextStyle(
                                color: myOrange, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            controller.showProduct[0].discountedPrice
                                    .toString() +
                                "SAR".tr,
                            //"${140} SAR".tr,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: myBlack,
                                fontWeight: FontWeight.bold),
                            maxLines: 3,
                          ),
                        ]),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                          spacing: 3.w,
                          children: [
                            Text("${1}${"large".tr}",
                                style: TextStyle(
                                    color: Colors.black,
                                    wordSpacing: 3,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold)),
                            Icon(Icons.more_vert),
                            Text(
                                "${controller.showProduct[0].calories}" +
                                    "   " +
                                    "Calories".tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    wordSpacing: 3,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.h),
                        child: Text("Description/Ingredient".tr,
                            style: TextStyle(
                                color: myOrange,
                                wordSpacing: 3,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold)),
                      ),

                      Padding(
                        padding: EdgeInsets.all(.5.h),
                        child: Text(
                          CashHelper.getData("lang") == "en"
                              ? controller.showProduct[0].descriptionName!.en!
                              : controller.showProduct[0].descriptionName!.ar!,
                          //"The menu has been called “a map that encourages easy navigation between hunger and satisfaction.” Mouthwatering restaurant menu descriptions can make your clients crave your offerings and happy patrons come back many times.",
                          style: TextStyle(
                              color: Colors.grey[700],
                              height: 2,
                              fontWeight: FontWeight.bold),
                          maxLines: 5,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                          child: Text("الاضافات".tr,
                              style: TextStyle(
                                  color: myOrange,
                                  wordSpacing: 3,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold))),

                      controller.showProduct[0].option!.isNotEmpty
                          ? ListView.builder(
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: myGreen.withOpacity(.1)),
                                child: Text(
                                    controller.showProduct[0].option![index]),
                              ),
                            )
                          : Text("لم تقم بوضع اي اضافة"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("المخزون من المنتج",
                            style: TextStyle(
                                color: myOrange,
                                wordSpacing: 3,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold)),
                      ),

                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Row(
                          //  spacing: 2.w,
                          children: [
                            Icon(
                              Icons.store,
                              color: myGreen,
                            ),
                            Container(
                              height: 5.h,
                              width: 15.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  color: myGreen.withOpacity(.1)),
                              child: Center(
                                child: Text(
                                    controller.showProduct[0].store.toString()),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.h),
                              child: Text("تعديل المخزون",
                                  style: TextStyle(
                                      color: myOrange,
                                      wordSpacing: 3,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            InkWell(
                              onTap: () => Get.defaultDialog(
                                  title: "تعديل بيانات المخزون",
                                  content: GetBuilder<ProductController>(
                                    builder: (controller) => Column(
                                      children: [
                                        MySmallTextField(
                                            controller:
                                                controller.editStoreController,
                                            obcure: false,
                                            label: "تعديل المخزون"),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text("زيادة"),
                                            Checkbox(
                                                value: controller.increaseValue,
                                                onChanged: (value) {
                                                  controller
                                                      .incrementData(value);
                                                }),
                                            Text("نقصان"),
                                            Checkbox(
                                                value: controller.decreaseValue,
                                                onChanged: (value) {
                                                  controller
                                                      .decrementData(value);
                                                }),
                                          ],
                                        ),
                                        Container(
                                          width: 12.h,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                              color: myGreen,
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: MaterialButton(
                                            //minWidth: 10.h,
                                            onPressed: () async {
                                              controller.editAmountStore();
                                            },
                                            child: Text("تعديل المنتج".tr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              child: Icon(
                                Icons.edit,
                                color: myGreen,
                              ),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: myGreen),
                            ),
                          ),
                          const Spacer(),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: myGreen,
                            child: CircleAvatar(
                                radius: 10,
                                child: Center(
                                    child:
                                        controller.showProduct[0].published == 1
                                            ? Icon(
                                                Icons.done,
                                                size: 5.w,
                                              )
                                            : Icon(
                                                Icons.cancel_outlined,
                                                size: 5.w,
                                              ))),
                          )
                        ]),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      // Container(
                      //   color: Colors.grey[200],
                      //   child: Row(children: [
                      //     Padding(
                      //       padding: EdgeInsets.all(1.h),
                      //       child: Text(
                      //         "Featured".tr,
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.bold, color: myGreen),
                      //       ),
                      //     ),
                      //     const Spacer(),
                      //     CircleAvatar(
                      //       radius: 15,
                      //       backgroundColor: myGreen,
                      //       child: CircleAvatar(
                      //           radius: 10,
                      //           child: Center(
                      //               child:
                      //                   controller.showProduct[0].featured == 1
                      //                       ? Icon(
                      //                           Icons.done,
                      //                           size: 5.w,
                      //                         )
                      //                       : Icon(
                      //                           Icons.cancel_outlined,
                      //                           size: 5.w,
                      //                         ))),
                      //     )
                      //   ]),
                      // ),

                      Padding(
                        padding: EdgeInsets.all(1.5.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                                minWidth: 25.h,
                                onPressed: () {
                                  Get.to(() => EditProduct(
                                        showProduct: controller.showProduct[0],
                                      ));
                                  // controller.editProducts(
                                  //     id: controller.showProduct[0].id);
                                },
                                color: myGreen,
                                child: Text(
                                  "Edit".tr,
                                  style: TextStyle(
                                      color: myWhite,
                                      fontWeight: FontWeight.bold),
                                )),
                            // SizedBox(width: 3.h),
                            // MaterialButton(
                            //     minWidth: 17.h,
                            //     onPressed: () {},
                            //     child: Text(
                            //       "Cancel".tr,
                            //       style: TextStyle(
                            //           color: myWhite,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     color: Colors.grey),
                          ],
                        ),
                      )

                      // Spacer(),
                    ],
                  )
                : SpinKitFadingCube(
                    color: myOrange,
                    size: 80.sp,
                  )),
      ),
    );
  }
}
