import 'package:flutter/material.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/products/details_product/widgets/details_container.dart';
import 'package:sboba_app_client/module/products/details_product/widgets/image_container.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
          Positioned(top: 0, child: ImageContainer()),
          Positioned(bottom: 0, child: DetailsContainer()),
        ]),
      ),
    );
  }
}
