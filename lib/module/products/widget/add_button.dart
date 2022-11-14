import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sboba_app_client/module/my_colors.dart';

class AddButton extends StatelessWidget {
  void Function()? pressed;
  AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 3,
      color: myGreen.withOpacity(.9),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Text(
        "Add Product",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: pressed,
    );
  }
}
