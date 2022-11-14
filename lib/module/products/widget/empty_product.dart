import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class EmptyProduct extends StatelessWidget {
  const EmptyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(1.h),
            child: const Image(
              image: AssetImage("assets/e.png"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Text("No Product yet"),
          ),
        ],
      ),
    );
  }
}
