import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lang_controller/lang_storage/lang_storage.dart';

class LanguageController extends GetxController {
  Locale? language;
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    CashHelper.putData("lang", langcode);

    Get.updateLocale(locale);
  }

  @override
  void onInit() async {
    String? sharedPrefLang;
    sharedPrefLang = await CashHelper.getData("lang");
    sharedPrefLang != null
        ? await CashHelper.getData("lang")
        : Get.deviceLocale!;
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    Get.updateLocale(language!);

    super.onInit();
  }
}
