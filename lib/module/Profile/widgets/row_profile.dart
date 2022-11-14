import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class ProfileRow extends StatelessWidget {
  IconData? iconData;
  String? text;
  ProfileRow({super.key, this.iconData, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: myOrange,
        ),
        Text(
          text!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
        )
      ],
    );
  }
}
