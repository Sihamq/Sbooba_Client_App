import 'package:flutter/material.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sizer/sizer.dart';

class CustomLabel {
  CustomLabel({this.arLabel, this.eLabel});

  String? arLabel;
  String? eLabel;
}

class CustomChip extends StatelessWidget {
  CustomChip({
    required this.label,
    required this.label2,
    // required this.onDeleted,
    required this.index,
  });

  final String label;
  final String label2;
  // CustomLabel label;
  //final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      //labelPadding: const EdgeInsets.only(left: 8.0),
      label: IntrinsicHeight(
        child: Row(
          children: [
            Text(label),
            VerticalDivider(
              // width: 2.h,
              color: myOrange,
              thickness: 1.w,
            ),
            Text(label2)
          ],
        ),
      ),
      //   deleteIcon: Icon(
      //     Icons.cancel_outlined,
      //     size: 20,
      //     color: myOrange,
      //   ),
      //   onDeleted: () {
      // // onDeleted(index);

      //   },
    );
  }
}
