import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/Profile/profile_controller.dart';
import 'package:sboba_app_client/module/create_profile_screen/create_controller.dart';
import 'package:sboba_app_client/module/my_colors.dart';

class RowGender extends StatelessWidget {
  const RowGender({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Wrap(
        children: [
          Text(
            "If you want to change gender , choose",
            style: TextStyle(color: myBlack, fontWeight: FontWeight.bold),
          ),
          RadioListTile(
              title: Text(
                "Male",
                style: TextStyle(color: myBlack, fontWeight: FontWeight.bold),
              ),
              value: 1,
              groupValue: controller.gender,
              onChanged: (value) {
                controller.changeGender(value);
              }),
          RadioListTile(
            title: Text(
              "Femaile",
              style: TextStyle(color: myBlack, fontWeight: FontWeight.bold),
            ),
            value: 0,
            groupValue: controller.gender,
            onChanged: (value) {
              controller.changeGender(value);
            },
          ),
        ],
      ),
    );
  }
}
