import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

//import 'package:flutter_hex_color/flutter_hex_color.dart';

class MyAddTextField extends StatelessWidget {
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
  MyAddTextField(
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
      // height: MediaQuery.of(context).size.height * .05,
      child: TextFormField(
        maxLines: maxline == null ? 1 : maxline,
        //scrollPadding: EdgeInsets.all(8),
        // Added this

        //  cursorHeight: MediaQuery.of(context).size.height * .08,
        obscureText: obcure,
        keyboardType: type,
        onChanged: (value) {},
        onTap: () {},
        validator: validate,
        controller: controller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelText: label,
            floatingLabelStyle:
                TextStyle(color: myGreen, fontWeight: FontWeight.bold),
            contentPadding: EdgeInsets.symmetric(horizontal: .5.w),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 1.5),
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: myOrange,
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(
              gapPadding: 4.0,
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
            ),
            suffix: InkWell(
                onTap: suffixPressed,
                child: Icon(
                  suffix,
                  size: 20,
                  color: Colors.black,
                )),
            fillColor: HexColor('#FFFFFF'),
            filled: true,
            prefixIcon: prefix == null
                ? null
                : Icon(
                    prefix,
                    color: myGreen,
                  ),
            // focusColor: HexColor('#0063FF'),

            //  hintText: label,
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(.6),
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
