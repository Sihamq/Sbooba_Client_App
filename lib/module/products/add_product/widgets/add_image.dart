import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/data/models/show_product.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/component/awesome_dialog.dart';
import '../../../shared/routes/api_routes.dart';

class AddImages extends StatelessWidget {
  ShowItem? showProduct;
  var proControoler = Get.put(ProductController);
  AddImages({super.key, this.showProduct});

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
              showProduct!.attachment!.isNotEmpty
                  ? SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount:
                              controller.showProduct[0].attachment!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey[50],
                                       // image: DecorationImage(
                                            // image
                                            // : 
                                           
                                            // NetworkImage(
                                            //     ApiLink.storeageImage +
                                            //         controller.showProduct[0]
                                            //             .attachment![index])
                                                       // )
                                                        ),child:  CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            Image.asset("assets/sh.png"),
                                        imageUrl: ApiLink.storeageImage +
                                            controller.img!,
                                      ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      CustomeAwesomeDialog().AwesomeDialogHeader(
                                          DialogType: DialogType.question,
                                          context: context,
                                          describe: "",
                                          subTitle:
                                              "هل انت متأكد من اضافة الصورة لسلة المهملات عند تعديل المنتج؟",
                                          mainTitle: "",
                                          btOnpressed: () =>
                                              controller.deleteImages(controller
                                                  .showProduct[0]
                                                  .attachment![index]));
                                    },
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: myWhite,
                                      child: const Icon(Icons.cancel),
                                    ),
                                  )
                                ]);
                          }),
                    )
                  : Center(
                      child: Text(
                        "جميع الصور محذوفة حاليا",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]),
                      ),
                    ),
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
