import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class EmptyCoupon extends StatelessWidget {
  const EmptyCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(2.h),
            child: Container(
              height: 10.h,
              width: 20.h,
              child: const Image(
                image: AssetImage("assets/noc.png"),
                // fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Text("No Coupons yet"),
          ),
        ],
      ),
    );
    ;
  }
}
