import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/money_with_draw/widgets/add_withDraw.dart';
import 'package:sboba_app_client/module/money_with_draw/widgets/money_card.dart';
import 'package:sboba_app_client/module/products/widget/add_button.dart';
import 'package:sizer/sizer.dart';

import '../my_colors.dart';
import '../products/widget/adding_container.dart';
import '../ticket/widget/ticket_card.dart';

class MoneyWithDraw extends StatelessWidget {
  MoneyWithDraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(color: myBlack),
        title: Text(
          "Money With Draw".tr,
          style: TextStyle(color: myBlack, fontWeight: FontWeight.bold),
        ),
        backgroundColor: myWhite,
        elevation: 0,
      ),
      body:
          //HorizontalCouponExample2()
          Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddingContainer(
              btnTitle: "Add with draw".tr,
              label: "Tickets".tr,
              noOfPro: 5,
              onTap: () {}),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(1.h),
                    child: InkWell(
                      child: MoneyCard(),
                      onTap: (() => showBottomSheet(
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          context: context,
                          builder: (context) => AddMoney())),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
    ;
  }
}
