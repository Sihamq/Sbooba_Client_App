import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../my_colors.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    var pinController = TextEditingController();
    return PinCodeTextField(
      autoFocus: true,
      // hintStyle: TextStyle(color: Colors.white),
      length: 5,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        selectedColor: myOrange,
        selectedFillColor: myOrange.withOpacity(.1),
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.white,
        activeColor: myGreen,
        shape: PinCodeFieldShape.box,
        inactiveColor: myGreen,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 50,
        fieldWidth: 40,
        // activeFillColor: myOrange.withOpacity(.1),
      ),
      animationDuration: Duration(milliseconds: 300),
      //backgroundColor: Colors.white,
      enableActiveFill: true,
      // errorAnimationController: errorController,
      controller: pinController,
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      appContext: context,
    );
  }
}
