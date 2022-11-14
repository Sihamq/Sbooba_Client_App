import 'package:get/get.dart';

import 'package:sboba_app_client/lang/ar.dart';
import 'package:sboba_app_client/lang/en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
