import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sboba_app_client/module/my_colors.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myWhite,
        title: Text("Notification"),
      ),
      body: Center(
          child: Column(children: [
        Container(
          child: Icon(
            Icons.notifications,
            size: 30,
            color: Colors.grey[400],
          ),
        ),
        Text(
          "No Notification Yet",
          style: TextStyle(color: Colors.grey[400]),
        )
      ])),
    );
  }
}
