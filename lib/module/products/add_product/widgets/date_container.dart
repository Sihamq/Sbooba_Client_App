import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
    as slideDialog;

import '../../../my_colors.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
              slideDialog.showSlideDialog(
                context: context,
                child: Text("Hello World"),
              );
            },
          )),
    );
  }
}
