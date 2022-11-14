import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:sizer/sizer.dart';

import '../../../my_colors.dart';

class MealsPartContainer extends StatelessWidget {
  String? noOrder;
  String? mealName;
  double? price;
  MealsPartContainer({super.key, this.mealName, this.noOrder, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.transparent,
            width: 1.w, //                   <--- border width here
          ),
        ),
        child: Row(children: [
          Container(
              width: MediaQuery.of(context).size.width * .097,
              height: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                color: myGreen.withOpacity(.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  noOrder!,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Text(
              mealName!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            ),
          ),
          Spacer(),
          Text(
            "${price} SAR",
            style: TextStyle(
                color: myOrange, fontWeight: FontWeight.bold, fontSize: 12.sp),
          )
        ]),
      ),
    );
  }
}
