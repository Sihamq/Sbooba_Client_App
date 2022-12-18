import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sboba_app_client/module/Profile/profile_binding.dart';
import 'package:sboba_app_client/module/Profile/profile_controller.dart';
import 'package:sboba_app_client/module/Profile/widgets/info_card.dart';
import 'package:sboba_app_client/module/Profile/widgets/profile_card.dart';
import 'package:sboba_app_client/module/Profile/widgets/profile_cards.dart';
import 'package:sboba_app_client/module/Profile/widgets/total_container.dart';
import 'package:sboba_app_client/module/commision_history/commision_history.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/module/shop_setting/shop_settig.dart';
import 'package:sizer/sizer.dart';

import '../../lang/lang_controller.dart';
import '../edit_profile/edit_profile.dart';
import '../login_screen/login_screen_view.dart';
import '../money_with_draw/money_with_draw.dart';
import '../payment/payment_history/payment_history.dart';
import '../payment/payment_info/payment_info.dart';
import '../shared/component/awesome_dialog.dart';
import '../ticket/ticket_view.dart';
import '../verification/change_password/change_password.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) => Stack(children: [
              Column(
                children: [
                  Stack(
                    //  alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .3,
                        decoration: BoxDecoration(color: myGreen.withOpacity(.1)
                            // gradient: LinearGradient(
                            //     colors: [myGreen, myOrange.withOpacity(.7)],
                            //     begin: Alignment.topLeft,
                            //     end: Alignment.bottomRight),
                            ),
                      ),
                    const  InfoCard()
                    ],
                  ),
                 const ProfilesCard(),
                ],
              ),

            ]),
          ),
        ),
      ),
    );
  }
}
