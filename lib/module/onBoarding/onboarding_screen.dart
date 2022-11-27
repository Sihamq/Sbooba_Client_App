import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/onBoarding/on_boarding_controller.dart';
import 'package:sboba_app_client/module/onBoarding/onboarding_item.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/splash_screen/splash_screen_animation.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardibgScreen extends StatelessWidget {
  const OnBoardibgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: myWhite,
        //   elevation: 0,
        // ),
        backgroundColor: myWhite,
        body: GetBuilder<OnBaordingController>(
          init: OnBaordingController(),
          builder: (controller) => Center(
            child: Padding(
              padding: EdgeInsets.only(top: 26.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: PageView.builder(
                            itemCount: controller.images.length,
                            controller: controller.boardController,
                            onPageChanged: ((value) =>
                                controller.onChange(value)),
                            itemBuilder: (BuildContext context, int index) {
                              return OnBoardingItem(
                                  onBarding: controller.images[index]);
                            })),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Row(
                        children: [
                          SmoothPageIndicator(
                            effect: ScrollingDotsEffect(
                              dotHeight: 15,
                              dotWidth: 15,
                              activeDotColor: myGreen,
                              spacing: 20,
                              dotColor: myGreen.withOpacity(.2),
                            ),

                            // ExpandingDotsEffect(
                            //   activeDotColor: Colors.blueGrey[700]!,
                            //   spacing: 20,
                            //   dotColor: Colors.white,
                            // ),
                            controller: controller.boardController,
                            count: controller.images.length,
                          ),
                          const Spacer(),
                          TextButton(
                              child: controller.isLast
                                  ? Text(
                                      "Done".tr,
                                      style: TextStyle(
                                          color: myBlack,
                                          fontSize: 12.sp,
                                          // wordSpacing: 2,
                                          // letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Cairo'),
                                    )
                                  : Text("Next".tr,
                                      style: TextStyle(
                                        color: myBlack,
                                        fontSize: 12.sp,
                                        //wordSpacing: 2,
                                        // letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                      )),
                              onPressed: () {
                                CashHelper.putData("onBoard", true);
                                Get.off(() => SplashScreen());
                                //  submitData(context);
                              })
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
