import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
    as slideDialog;

import '../../../my_colors.dart';

class DateContainer extends GetView<ProductController> {
  const DateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(Coupo)
    return Padding(
        padding: EdgeInsets.all(1.h),
        child: Container(
          width: 12.w,
          height: 9.w,
          decoration: BoxDecoration(
            color: myGreen,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: Icon(
              Icons.calendar_month,
              color: myWhite,
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();
              slideDialog.showSlideDialog(
                context: context,
                child: Obx(
                  () => Column(
                    children: [
                      SfDateRangePicker(
                        navigationDirection:
                            DateRangePickerNavigationDirection.vertical,
                        controller: controller.dateController.value,
                        selectionMode: DateRangePickerSelectionMode.range,
                        onSelectionChanged: controller.selectionChanged,
                        view: DateRangePickerView.month,
                        allowViewNavigation: true,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: myGreen,
                                borderRadius: BorderRadius.circular(15)),
                            child: TextButton(
                                onPressed: () {
                                  controller.dateController.value.dispose();

                                  controller.startDate.value = "00-00-00";
                                  controller.endDate.value = "00-00-00";

                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel".tr,
                                  style: TextStyle(
                                      color: myWhite,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            width: 1.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: myGreen,
                                borderRadius: BorderRadius.circular(15)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "ok".tr,
                                  style: TextStyle(
                                      color: myWhite,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
