import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class EmptyProduct extends StatelessWidget {
  String? img, text;
  double? width, height;
  EmptyProduct({super.key, this.img, this.text, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Center(
        child: Column(
          children: [
            Image(
              height: height,
              width: width,
              image: AssetImage(img!),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: Text(
                text!,
                style: TextStyle(
                    color: myOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
