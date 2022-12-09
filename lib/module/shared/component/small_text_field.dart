import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

//import 'package:flutter_hex_color/flutter_hex_color.dart';

class MySmallTextField extends StatelessWidget {
  late TextEditingController controller;
  TextInputType? type;
  void Function(String)? onSubmit;
  void Function()? onTap;
  String? Function(String?)? validate;
  late String label;
  IconData? prefix;
  IconData? suffix;
  late bool obcure;
  int? maxline;
  void Function()? suffixPressed;
  MySmallTextField(
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
      this.maxline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: 41.w,
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
        decoration: InputDecoration(
            //alignLabelWithHint: true,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle:
                TextStyle(color: myGreen, fontWeight: FontWeight.bold),
            labelText: label,
            suffixIconColor: myGreen,
            suffixIcon: suffix == null
                ? null
                : InkWell(child: Icon(suffix), onTap: suffixPressed),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 2,
              minHeight: 2,
            ),
            // contentPadding: EdgeInsets.symmetric(horizontal: 6.h),
            focusedBorder: OutlineInputBorder(
              gapPadding: 1.h,
              borderSide: const BorderSide(color: Colors.green, width: 1),
              borderRadius: BorderRadius.circular(14.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: myOrange,
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: myOrange, width: 1),
            ),

            //     )),
            fillColor: HexColor('#FFFFFF'),
            filled: true,
            prefixIcon: prefix == null
                ? null
                : Icon(
                    prefix,
                    color: HexColor('#5D5E60'),
                  ),
            // focusColor: HexColor('#0063FF'),
            // hintText: label,
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(.9),
                fontSize: 7.sp,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
