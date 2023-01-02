import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:sboba_app_client/module/verification/email_verification/widget/arrow_container.dart';
import 'package:sizer/sizer.dart';

import '../../shared/component/green_button.dart';
import 'otp.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myGreen;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // actions: [ArrowContainer()],
        ),
        // appBar: AppBar(backgroundColor: Colors.white),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  left: .3.h,
                  right: .3.h,
                  top: 15.h,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Center(
                          child: Container(
                            child: const Image(
                                image: AssetImage("assets/121.png")),
                          ),
                        ),
                      ),
                      Center(
                        child: Text("Please Check your Email".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.sp)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Center(
                          child: Text("digits".tr,
                              style: TextStyle(fontSize: 12.sp, height: 2)),
                        ),
                      ),
                      BlueButton(
                          onpress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTPScreen()),
                            );
                          },
                          title: Text(
                            "Ok".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp),
                          ),
                          hight: 6.h,
                          width: 120.h),
                    ]))));
  }
}
