import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  Color? color;
  String? text;
  void Function()? pressed;
  OrderButton({super.key, this.color, this.text, this.pressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color!,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      child: Text(
        text!,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: pressed,
    );
    ;
  }
}
