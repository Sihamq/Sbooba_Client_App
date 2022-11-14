import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageContainer extends StatelessWidget {
  var pageController = PageController();
  ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
            height: 33.h,
            width: 100.w,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: PageView.builder(
              allowImplicitScrolling: true,
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                image: AssetImage(
                  "assets/pp.jpg",
                ),
              ))),
            )),
        Positioned(
          bottom: 45.w,
          left: 2.h,
          child: InkWell(
            onTap: () => navigator!.pop(),
            child: Container(
                height: 100,
                // width: 100,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: myWhite,
                    ),
                    Text(
                      "Product Details",
                      style: TextStyle(
                          color: myWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    )
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: SmoothPageIndicator(
            effect: ScrollingDotsEffect(
              dotHeight: 15,
              dotWidth: 15,
              activeDotColor: myGreen,
              spacing: 20,
              dotColor: myWhite,
            ),
            controller: pageController,
            count: 3,
          ),
        ),
      ],
    );
  }
}
