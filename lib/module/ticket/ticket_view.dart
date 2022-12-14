import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/ticket/widget/create_tickets.dart';
import 'package:sboba_app_client/module/ticket/widget/ticket_card.dart';
import 'package:sizer/sizer.dart';

import '../my_colors.dart';
import '../products/add_product/add_product_view.dart';
import '../products/widget/adding_container.dart';
import '../shared/component/green_button.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(color: myBlack),
        title: Text(
          "Tickets".tr,
          style: TextStyle(color: myBlack, fontWeight: FontWeight.bold),
        ),
        backgroundColor: myWhite,
        elevation: 0,
      ),
      body:
          //HorizontalCouponExample2()
          Column(
        children: [
          AddingContainer(
            btnTitle: "Add with draw".tr,
            label: "Tickets ".tr,
            noOfPro: 5,
            onTap: (() {
              //Get.to(() => AddProduct());
            }),
          ),
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
                      child: TicketCard(),
                      onTap: (() => showBottomSheet(
                            backgroundColor: myWhite,
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(35.0),
                              ),
                            ),
                            context: context,
                            builder: (context) => CreateTicket(),
                          )),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
