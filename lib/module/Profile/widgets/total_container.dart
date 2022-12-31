import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class TotalContainer extends StatelessWidget {
  String? secondText;
  int? total;
  TotalContainer({super.key, this.secondText,this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.w,
      width: 18.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: myGreen),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: .5.h, right: .5.h),
              child: Text(
                secondText!,
                style: TextStyle(
                    color: myWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 9.sp),
              ),
            ),
            Text(
              total.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 10.sp, color: myWhite),
            ),
          ]),
    );
  }
}
