import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

enum Meal { mainMeals, sweet, drinks, spells }

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
            const Spacer(),
            InkWell(
              child: const Icon(
                Icons.search,
              ),
              onTap: () {},
            )
          ]),
        ),
        RadioListTile(
            activeColor: myOrange,
            title: Text(
              "Sweets".tr,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            value: Meal.sweet,
            groupValue: () {},
            onChanged: ((value) {})),
        RadioListTile(
            activeColor: myOrange,
            title: Text(
              "Drinks".tr,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            value: Meal.drinks,
            groupValue: () {},
            onChanged: ((value) {})),
        RadioListTile(
            activeColor: myOrange,
            title: Text(
              "Private Orders/Spells".tr,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            value: Meal.spells,
            groupValue: () {},
            onChanged: ((value) {})),
        RadioListTile(
            activeColor: myOrange,
            title: Text(
              "Main Meals".tr,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            value: Meal.mainMeals,
            groupValue: () {},
            onChanged: ((value) {}))
      ],
    );
  }
}
