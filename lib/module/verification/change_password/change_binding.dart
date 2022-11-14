import 'package:get/get.dart';

import 'change_controller.dart';

class ChangePassBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChangePassController());
  }
}
