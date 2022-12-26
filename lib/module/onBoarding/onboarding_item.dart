import 'package:flutter/material.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/onBoarding/onBoardingModel.dart';
import 'package:sizer/sizer.dart';

class OnBoardingItem extends StatelessWidget {
  OnBoardingModel? onBarding;
  OnBoardingItem({super.key, this.onBarding});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(onBarding!.image)),
        Text(
          onBarding!.title,
          style: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.bold, color: myOrange),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 3.h, right: 3.h),
            child: Text(
              onBarding!.body,
              style: TextStyle(fontSize: 9.sp, color: Colors.grey[400]),
            ),
          ),
        )
      ],
    );
  }
}
