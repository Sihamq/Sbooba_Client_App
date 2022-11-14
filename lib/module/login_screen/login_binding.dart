import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:sboba_app_client/module/login_screen/login_screen_view.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginScreen());
  }
}
