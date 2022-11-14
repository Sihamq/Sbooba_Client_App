import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sboba_app_client/module/onBoarding/onBoardingModel.dart';
import 'package:sizer/sizer.dart';

class OnBoardingItem extends StatelessWidget {
  OnBoardingModel? onBarding;
  OnBoardingItem({super.key, this.onBarding});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(onBarding!.image)),
        Text(
          onBarding!.title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        Text(onBarding!.body,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[400]))
      ],
    );
  }
}
