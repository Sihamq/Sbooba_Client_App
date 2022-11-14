import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/notification/widgets/notification_card.dart';
import 'package:sizer/sizer.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(color: myBlack),
        title: Text(
          "Notifications".tr,
          style: TextStyle(color: myBlack, fontWeight: FontWeight.bold),
        ),
        backgroundColor: myWhite,
        elevation: 0,
      ),
      body:
          //HorizontalCouponExample2()
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //     childAspectRatio: 5 / 2,
              //     maxCrossAxisExtent: 100,
              //     mainAxisSpacing: 100,
              //     crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(.5.h),
                  child: NotificationCard(),
                );
              }),
    );
  }
}
