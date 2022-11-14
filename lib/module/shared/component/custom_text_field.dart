import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

//import 'package:flutter_hex_color/flutter_hex_color.dart';

class MyTextField extends StatelessWidget {
  late TextEditingController controller;
  TextInputType? type;
  void Function(String)? onSubmit;
  void Function()? onTap;
  String? Function(String?)? validate;
  late String label;
  IconData? prefix;
  IconData? suffix;
  bool obcure;
  int? maxline;
  void Function()? suffixPressed;
  void Function()? onTapIcon;
  MyTextField(
      {Key? key,
      required this.controller,
      this.type,
      required this.obcure,
      this.onSubmit,
      this.onTap,
      this.validate,
      required this.label,
      this.prefix,
      this.suffix,
      this.suffixPressed,
      this.maxline,
      this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * .08,
      child: TextFormField(
        maxLines: maxline == null ? 1 : maxline,
        //  scrollPadding: EdgeInsets.all(8),
        // Added this

        //  cursorHeight: MediaQuery.of(context).size.height * .08,
        obscureText: obcure,
        keyboardType: type,
        onChanged: (value) {},
        onTap: () {},
        validator: validate,
        controller: controller,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(

            // contentPadding: EdgeInsets.symmetric(horizontal: 11.0),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: HexColor('#707070'), width: 1.5),
            ),
            // suffix: InkWell(
            //     onTap: suffixPressed,
            //     child: Icon(
            //       suffix,
            //       size: 20,
            //       color: Colors.black,
            //     )),
            fillColor: HexColor('#FFFFFF'),
            filled: true,
            suffixIcon: InkWell(
              child: Icon(
                suffix,
                color: myBlack,
                size: 20,
              ),
              onTap: onTapIcon,
            ),
            // focusColor: HexColor('#0063FF'),
            hintText: label,
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(.6),
                fontSize: 9.sp,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
