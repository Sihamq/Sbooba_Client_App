import 'package:get/get.dart';
import 'package:sboba_app_client/module/Profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
