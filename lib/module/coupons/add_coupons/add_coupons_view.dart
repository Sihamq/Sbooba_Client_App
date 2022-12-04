import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sboba_app_client/module/coupons/add_coupons/widgets/custom_tabBar.dart';
import 'package:sboba_app_client/module/my_colors.dart';

class AddCoupons extends StatelessWidget {
  const AddCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: myBlack),
        title: Text(
          "Add coupons".tr,
          style: TextStyle(color: myBlack, fontWeight: FontWeight.bold),
        ),
        backgroundColor: myWhite,
        elevation: 0,
      ),
      body: CustomTabBar(),
    );
  }
}
