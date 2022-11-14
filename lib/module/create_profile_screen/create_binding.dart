import 'package:get/get.dart';
import 'package:sboba_app_client/module/create_profile_screen/create_controller.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateController());
  }
}
