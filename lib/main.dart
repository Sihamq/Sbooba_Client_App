//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sboba_app_client/lang/lang_controller.dart';
import 'package:sboba_app_client/lang/translation.dart';
import 'package:sboba_app_client/module/home_screen/home_binding.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/my_colors.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/splash_screen/splash_screen_animation.dart';
import 'package:sizer/sizer.dart';

import 'module/products/product_cateogry.dart';
import 'module/shared/DioHelper/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await DioHelper.init();
  await CashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.put(LanguageController());
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        // useInheritedMediaQuery: true,
        translations: Translation(),

        locale: languageController.language,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: myGreen,
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark),
          ),
          fontFamily: 'Cairo',
          primarySwatch: Colors.orange,
          primaryColor: myGreen,
        ),
        initialBinding: HomeBinding(),
        debugShowCheckedModeBanner: false,
        title: 'Sboba App',
        home: const SplashScreen(),
        // ProductCateogry(),
      ),
    );
  }
}
