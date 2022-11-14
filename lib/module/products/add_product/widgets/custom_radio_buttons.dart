import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class CustomRdaioButton extends StatelessWidget {
  const CustomRdaioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5.h,
          width: 100.w,
          color: myGreen.withOpacity(.1),
          child: Row(children: [
            Text(
              "Select Catogrey".tr,
              style: TextStyle(fontSize: 12.sp),
            ),
            Spacer(),
            InkWell(
              child: Icon(
                Icons.search,
              ),
              onTap: () {},
            )
          ]),
        ),
        RadioListTile(
            activeColor: myOrange,
            title: Text(
              "Candy".tr,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            value: 1,
            groupValue: () {},
            onChanged: ((value) {})),
        RadioListTile(
            activeColor: myOrange,
            title: Text(
              "Candy".tr,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            value: 1,
            groupValue: () {},
            onChanged: ((value) {})),
        RadioListTile(
            activeColor: myOrange,
            title: Text(
              "Candy".tr,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            value: 1,
            groupValue: () {},
            onChanged: ((value) {}))
      ],
    );
  }
}
