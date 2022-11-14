import 'package:flutter/material.dart';

import '../module/my_colors.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGreen,
      appBar: AppBar(backgroundColor: myGreen, elevation: 0),
      body: Center(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/splash.png"))))),
    );
  }
}
