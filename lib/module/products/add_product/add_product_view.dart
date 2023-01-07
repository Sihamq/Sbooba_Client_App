import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sboba_app_client/data/models/cateogry.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/add_product/widgets/date_container.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sboba_app_client/module/products/widget/add_pro_images.dart';
import 'package:sboba_app_client/module/products/widget/adding_container.dart';
import 'package:sboba_app_client/module/shared/component/green_button.dart';
import 'package:sboba_app_client/module/shared/component/small_text_field.dart';
import 'package:sboba_app_client/module/shared/function/validInput.dart';
import 'package:sizer/sizer.dart';
//import 'package:expansion_card/expansion_card.dart';

import '../../shared/component/add_text_formfield.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class AddProduct extends GetView<ProductController> {
  AddProduct({super.key});
  //Get.put(ProductController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: myBlack),
          elevation: 0,
          title: Text(
            "Add Product".tr,
            style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.bold, color: myGreen),
          ),
          backgroundColor: myWhite),
      body: GetBuilder<ProductController>(
        builder: (controller) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Text(
                    "main".tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          controller.getImageBloc(ImageSource.gallery);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            width: 22.h,
                            height: 15.h,
                            child: Center(
                                child: controller.imagee == null
                                    ? const Icon(Icons.add_a_photo)
                                    : Image.file(
                                        controller.imagee!,
                                        fit: BoxFit.cover,
                                      ))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors
                              .white, //background color of dropdown button
                          border: Border.all(
                              color: myOrange,
                              width: 2), //border of dropdown button
                          borderRadius: BorderRadius.circular(
                              20), //border raiuds of dropdown button
                          boxShadow: <BoxShadow>[
                            //apply shadow on Dropdown button
                            BoxShadow(
                                color: myOrange,
                                blurRadius: 0.1), //shadow for button
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 1.h, bottom: 1.h, left: 2.h, right: 2.h),
                        child: DropdownButton(
                          isExpanded: true,
                          autofocus: true,
                          dropdownColor: myWhite,
                          focusColor: myOrange,
                          // isExpanded: true,
                          underline: const SizedBox(),
                          elevation: 2,
                          hint: Center(
                            child: controller.catSelect == null
                                ? Text(
                                    "kind".tr,
                                    style: TextStyle(fontSize: 13.sp),
                                  )
                                : Text(
                                    controller.catSelect,
                                    style: TextStyle(fontSize: 13.sp),
                                  ),
                          ),
                          alignment: AlignmentDirectional.center,
                          iconSize: 20.sp,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: myOrange,
                            size: 25.sp,
                          ),
                          items: controller.productCateogry
                              .map<DropdownMenuItem<CateogryItems>>(
                                  (cat) => DropdownMenuItem(
                                        value: cat,
                                        child: Center(
                                          child: Text(cat.name!),
                                        ),
                                      ))
                              .toList(),
                          onChanged: ((value) {
                            controller.changeSelectCategory(value);
                          }),
                        ),
                      ),
                      //),

                      // MySmallTextField(
                      //   type: TextInputType.number,
                      //   controller: controller.miniProController,
                      //   obcure: false,
                      //   label: "Candy".tr,
                      //   suffix: Icons.arrow_right_alt,
                      //   suffixPressed: () {
                      //     Get.defaultDialog(
                      //         title: "'",
                      //         content: CustomRdaioButton(),
                      //         middleText: "😊");
                      //   },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: MyAddTextField(
                      controller: controller.productNameArabicController,
                      obcure: false,
                      label: "Name".tr,
                      validate: (p0) => validInput(p0!, 3, 12, "name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: MyAddTextField(
                      controller: controller.productNameEnglishController,
                      obcure: false,
                      label: "name".tr,
                      validate: (p0) => validInput(p0!, 3, 12, "name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: MyAddTextField(
                        type: TextInputType.number,
                        controller: controller.productCaloriesController,
                        obcure: false,
                        label: "Calories".tr),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: MyAddTextField(
                      maxline: 4,
                      controller: controller.productDescriptionArabicController,
                      obcure: false,
                      label: "Description/Ingredient".tr,
                      validate: (p0) => validInput(p0!, 3, 500, "name"),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(1.h),
                      child: MyAddTextField(
                        maxline: 4,
                        controller:
                            controller.productDescriptionEnglishController,
                        obcure: false,
                        label: "Ingredient".tr,
                        validate: (p0) => validInput(p0!, 3, 500, "name"),
                      )),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: .5.h,
                  //     bottom: .5.h,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       // MySmallTextField(
                  //       //     controller: controller.miniProController,
                  //       //     obcure: false,
                  //       //     type: TextInputType.number,
                  //       //     label: "Quantity".tr),
                  //       MySmallTextField(
                  //         controller: controller.productAvialbleController,
                  //         obcure: false,
                  //         label: "Minium".tr,
                  //         type: TextInputType.number,
                  //         validate: (p0) => validInput(p0!, 1, 12, "number"),
                  //       ),
                  //       SizedBox(
                  //         width: 3.h,
                  //       ),
                  //       Container(
                  //         height: 6.h,
                  //         width: 19.h,
                  //         decoration: BoxDecoration(
                  //             color: Colors
                  //                 .white, //background color of dropdown button
                  //             border: Border.all(
                  //                 color: myOrange,
                  //                 width: 2), //border of dropdown button
                  //             borderRadius: BorderRadius.circular(
                  //                 20), //border raiuds of dropdown button
                  //             boxShadow: <BoxShadow>[
                  //               //apply shadow on Dropdown button
                  //               BoxShadow(
                  //                   color: myOrange,
                  //                   blurRadius: 0.1), //shadow for button
                  //             ]),
                  //         child: Padding(
                  //           padding: EdgeInsets.only(
                  //             top: 1.h,
                  //             bottom: 1.h,
                  //           ),
                  //           child: DropdownButton(
                  //             isExpanded: true,
                  //             autofocus: true,
                  //             dropdownColor: myWhite,
                  //             focusColor: myOrange,
                  //             // isExpanded: true,
                  //             underline: const SizedBox(),
                  //             elevation: 2,
                  //             hint: Center(
                  //               child: Text(
                  //                 "الوحده",
                  //                 style: TextStyle(fontSize: 13.sp),
                  //               ),
                  //             ),
                  //             alignment: AlignmentDirectional.center,
                  //             iconSize: 20.sp,
                  //             icon: Icon(
                  //               Icons.keyboard_arrow_down,
                  //               color: myOrange,
                  //               size: 25.sp,
                  //             ),
                  //             items: [],
                  //             onChanged: ((value) {
                  //               // controller.changeSelectCategory(value);
                  //             }),
                  //           ),
                  //         ),
                  //         //),

                  //         // MySmallTextField(
                  //         //   type: TextInputType.number,
                  //         //   controller: controller.miniProController,
                  //         //   obcure: false,
                  //         //   label: "Candy".tr,
                  //         //   suffix: Icons.arrow_right_alt,
                  //         //   suffixPressed: () {
                  //         //     Get.defaultDialog(
                  //         //         title: "'",
                  //         //         content: CustomRdaioButton(),
                  //         //         middleText: "😊");
                  //         //   },
                  //       ),
                  //     ],
                  //   ),
                  // SizedBox(
                  //   width: .5.h,
                  // ),
                  // MySmallTextField(
                  //   controller: controller.productAvialbleController,
                  //   obcure: false,
                  //   label: "Minium".tr,
                  //   type: TextInputType.number,
                  //   validate: (p0) => validInput(p0!, 1, 12, "number"),
                  // ),
                  // SizedBox(
                  //   width: .5.h,
                  // ),
                  // MySmallTextField(
                  //   controller: controller.productTagController,
                  //   obcure: false,
                  //   label: "Flat".tr,
                  //   suffix: Icons.arrow_drop_down,
                  //   suffixPressed: () {},
                  // ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: .5.h,
                      bottom: .5.h,
                    ),
                    child: ExpansionTileCard(
                        heightFactorCurve: Curves.bounceInOut,
                        baseColor: myWhite,
                        title: Text(
                          "اضافة الوحدات مع الاسعار",
                          style: TextStyle(),
                        ),
                        children: [
                          Container(
                            height: 40.h,
                            child: Column(children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MySmallTextField(
                                        controller:
                                            controller.miniProController,
                                        obcure: false,
                                        type: TextInputType.number,
                                        label: "unitprice".tr),
                                  ),
                                  SizedBox(
                                    width: 3.h,
                                  ),
                                  Container(
                                    height: 6.h,
                                    width: 19.h,
                                    decoration: BoxDecoration(
                                        color: Colors
                                            .white, //background color of dropdown button
                                        border: Border.all(
                                            color: myOrange,
                                            width:
                                                2), //border of dropdown button
                                        borderRadius: BorderRadius.circular(
                                            20), //border raiuds of dropdown button
                                        boxShadow: <BoxShadow>[
                                          //apply shadow on Dropdown button
                                          BoxShadow(
                                              color: myOrange,
                                              blurRadius:
                                                  0.1), //shadow for button
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 1.h,
                                        bottom: 1.h,
                                      ),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        autofocus: true,
                                        dropdownColor: myWhite,
                                        focusColor: myOrange,
                                        // isExpanded: true,
                                        underline: const SizedBox(),
                                        elevation: 2,
                                        hint: Center(
                                          child: Text(
                                            "الوحده",
                                            style: TextStyle(fontSize: 13.sp),
                                          ),
                                        ),
                                        alignment: AlignmentDirectional.center,
                                        iconSize: 20.sp,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: myOrange,
                                          size: 25.sp,
                                        ),
                                        items: [],
                                        onChanged: ((value) {
                                          // controller.changeSelectCategory(value);
                                        }),
                                      ),
                                    ),
                                    //),

                                    // MySmallTextField(
                                    //   type: TextInputType.number,
                                    //   controller: controller.miniProController,
                                    //   obcure: false,
                                    //   label: "Candy".tr,
                                    //   suffix: Icons.arrow_right_alt,
                                    //   suffixPressed: () {
                                    //     Get.defaultDialog(
                                    //         title: "'",
                                    //         content: CustomRdaioButton(),
                                    //         middleText: "😊");
                                    //   },
                                  ),
                                ],
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
                                    child: Text("اضافة".tr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.sp,
                                        )),
                                  ),
                                ),
                              ),
                              ExpansionTileCard(
                                elevation: 0,
                                title: Text("وحدات فرعية للمنتج الواحد"),
                                children: [
                                  Container(
                                    height: 10.h,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MySmallTextField(
                                              controller:
                                                  controller.miniProController,
                                              obcure: false,
                                              type: TextInputType.number,
                                              label: "unitprice".tr),
                                        ),
                                        SizedBox(
                                          width: 3.h,
                                        ),
                                        Container(
                                          height: 6.h,
                                          width: 19.h,
                                          decoration: BoxDecoration(
                                              color: Colors
                                                  .white, //background color of dropdown button
                                              border: Border.all(
                                                  color: myOrange,
                                                  width:
                                                      2), //border of dropdown button
                                              borderRadius: BorderRadius.circular(
                                                  20), //border raiuds of dropdown button
                                              boxShadow: <BoxShadow>[
                                                //apply shadow on Dropdown button
                                                BoxShadow(
                                                    color: myOrange,
                                                    blurRadius:
                                                        0.1), //shadow for button
                                              ]),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 1.h,
                                              bottom: 1.h,
                                            ),
                                            child: DropdownButton(
                                              isExpanded: true,
                                              autofocus: true,
                                              dropdownColor: myWhite,
                                              focusColor: myOrange,
                                              // isExpanded: true,
                                              underline: const SizedBox(),
                                              elevation: 2,
                                              hint: Center(
                                                child: Text(
                                                  "الوحده",
                                                  style: TextStyle(
                                                      fontSize: 13.sp),
                                                ),
                                              ),
                                              alignment:
                                                  AlignmentDirectional.center,
                                              iconSize: 20.sp,
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: myOrange,
                                                size: 25.sp,
                                              ),
                                              items: [],
                                              onChanged: ((value) {
                                                // controller.changeSelectCategory(value);
                                              }),
                                            ),
                                          ),
                                          //),

                                          // MySmallTextField(
                                          //   type: TextInputType.number,
                                          //   controller: controller.miniProController,
                                          //   obcure: false,
                                          //   label: "Candy".tr,
                                          //   suffix: Icons.arrow_right_alt,
                                          //   suffixPressed: () {
                                          //     Get.defaultDialog(
                                          //         title: "'",
                                          //         content: CustomRdaioButton(),
                                          //         middleText: "😊");
                                          //   },
                                        ),
                                      ],
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
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: MaterialButton(
                                        //minWidth: 10.h,
                                        onPressed: () async {
                                          controller.selectImages(context);
                                        },
                                        child: Text("اضافة".tr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.sp,
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                          ),
                        ]),

                    // SizedBox(
                    //   width: .5.h,
                    // ),
                    // MySmallTextField(
                    //   controller: controller.productAvialbleController,
                    //   obcure: false,
                    //   label: "Minium".tr,
                    //   type: TextInputType.number,
                    //   validate: (p0) => validInput(p0!, 1, 12, "number"),
                    // ),
                    // SizedBox(
                    //   width: .5.h,
                    // ),
                    // MySmallTextField(
                    //   controller: controller.productTagController,
                    //   obcure: false,
                    //   label: "Flat".tr,
                    //   suffix: Icons.arrow_drop_down,
                    //   suffixPressed: () {},
                    // ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: .5.h,
                  //     bottom: .5.h,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       MySmallTextField(
                  //           type: TextInputType.number,
                  //           controller: controller.unitPriceController,
                  //           obcure: false,
                  //           label: "unitprice".tr),
                  //       SizedBox(
                  //         width: .5.h,
                  //       ),
                  //       MySmallTextField(
                  //           controller: controller.unitPurchesController,
                  //           obcure: false,
                  //           label: "unitpurchesprice".tr,
                  //           validate: (p0) => validInput(p0!, 1, 15, "number"),
                  //           type: TextInputType.number),
                  //     ],
                  //   ),
                  // ),
                  ExpansionTileCard(
                    title: Text("الاضافات"),
                    children: [Column(children: [
                      Text("ضع اضافاتك  التي قد يطلبها العميل منك")
                      MyAddTextField(controller:AddingContainer.tex, obcure: false, label: "اضافاتي")
                    ],)
  
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Container(
                      width: 100.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300]),
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Row(
                          children: [
                            Text(
                              "Published".tr,
                              style: TextStyle(
                                  color: myGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                            ),
                            const Spacer(),
                            Switch(
                              focusColor: myOrange,
                              value: controller.featured,
                              onChanged: (value) {
                                controller.changeFeaturedswitch(value);
                              },
                              activeColor: myOrange,
                              inactiveThumbColor: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: AddProImages(),
                  ),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.all(1.h),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors
                                  .white, //background color of dropdown button
                              border: Border.all(
                                  color: myOrange,
                                  width: 2), //border of dropdown button
                              borderRadius: BorderRadius.circular(
                                  15), //border raiuds of dropdown button
                              boxShadow: <BoxShadow>[
                                //apply shadow on Dropdown button
                                BoxShadow(
                                    color: myOrange,
                                    blurRadius: 0.1), //shadow for button
                              ]),
                          child: DropdownButton(
                            isExpanded: true,
                            autofocus: true,
                            dropdownColor: myWhite,
                            focusColor: myOrange,
                            underline: const SizedBox(),
                            elevation: 2,
                            hint: Center(
                              child: controller.disSelected.value == ""
                                  ? Padding(
                                      padding: EdgeInsets.all(1.h),
                                      child: Text(
                                        "dis".tr,
                                        style: TextStyle(fontSize: 13.sp),
                                      ),
                                    )
                                  : Text(
                                      controller.disSelected.value,
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                            ),
                            alignment: AlignmentDirectional.center,
                            iconSize: 20.sp,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: myOrange,
                              size: 25.sp,
                            ),
                            items: controller.discountTypeList
                                .map<DropdownMenuItem<CateogryItems>>(
                                    (cat) => DropdownMenuItem(
                                          value: cat,
                                          child: Center(
                                            child: Text(cat.name!),
                                          ),
                                        ))
                                .toList(),
                            onChanged: ((value) {
                              controller.changeSelectDiscount(value);
                            }),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(.5.h),
                    child: Wrap(children: [
                      Text(
                        "Range".tr,
                        style: TextStyle(
                            color: myOrange,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      const DateContainer(),
                      MySmallTextField(
                        label: "Discount".tr,
                        type: TextInputType.number,
                        controller: controller.productDiscountController,
                        obcure: false,
                        // validate: (p0) => p0>,
                      )
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]),
                            child: Padding(
                              padding: EdgeInsets.all(1.h),
                              child: Text(
                                "${"start".tr}       ${controller.startDate.value}",
                                style: TextStyle(
                                    color: myGreen,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            width: 100.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]),
                            child: Padding(
                              padding: EdgeInsets.all(1.h),
                              child: Text(
                                "end".tr + "    ${controller.endDate.value}",
                                style: TextStyle(
                                    color: myGreen,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlueButton(
                      onpress: () async {
                        // print("stoore");
                        FocusScope.of(context).unfocus();
                        await controller.storeProduct();
                      },
                      title: controller.isLoading != true
                          ? Text("Save".tr,
                              style: TextStyle(
                                  color: myWhite, fontWeight: FontWeight.bold))
                          : SpinKitDualRing(
                              color: myOrange,
                              size: 20.sp,
                            ),
                      hight: 7.h,
                      width: 100.w)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
