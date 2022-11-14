import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sizer/sizer.dart';

import '../../my_colors.dart';
import '../../shared/component/add_text_formfield.dart';
import '../../shared/component/green_button.dart';
import '../../shared/component/small_text_field.dart';

class PaymentInfo extends StatelessWidget {
  var bankName = TextEditingController();
  var bankAcountName = TextEditingController();
  var bankAcountNumber = TextEditingController();
  var bankRoutingNumber = TextEditingController();
  PaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: myBlack),
        elevation: 0,
        backgroundColor: myWhite,
        title: Text(
          "Payment Info".tr,
          style: TextStyle(color: myBlack),
        ),
      ),
      backgroundColor: Colors.white,
      // appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
              top: 4.h,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.all(2.h),
                child: MyAddTextField(
                  controller: bankName,
                  obcure: false,
                  label: "Bank".tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                child: MyAddTextField(
                  controller: bankAcountName,
                  obcure: false,
                  label: "BankAcountName".tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                child: MyAddTextField(
                  controller: bankAcountNumber,
                  obcure: false,
                  label: "Acount".tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                child: MyAddTextField(
                  controller: bankRoutingNumber,
                  obcure: false,
                  label: "Routing".tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                child: Container(
                  color: Colors.grey[200],
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Text("Cash".tr),
                    ),
                    Spacer(),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: myOrange,
                      inactiveThumbColor: Colors.grey,
                    )
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 2.h, right: 2.h),
                child: Container(
                  color: Colors.grey[200],
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Text("Bank Payment".tr),
                    ),
                    Spacer(),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: myOrange,
                      inactiveThumbColor: Colors.grey,
                    )
                  ]),
                ),
              ),

              BlueButton(
                  onpress: () {
                    // Get.to(() => HomeScreen());
                  },
                  title: Text(
                    "Save".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                  hight: 7.h,
                  width: 48.h),

              //Spacer(),
            ])),
      ),
    );
  }
}
