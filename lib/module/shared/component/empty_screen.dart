import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class EmptyProduct extends StatelessWidget {
  String? img, text;
  EmptyProduct({super.key, this.img, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(3.h),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              child: Image(
                image: AssetImage(img!),
                //fit: BoxFit.fill,
                // filterQuality: FilterQuality.high,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Text(
              text!,
              style: TextStyle(
                  color: myOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.sp),
            ),
          ),
        ],
      ),
    );
  }
}
