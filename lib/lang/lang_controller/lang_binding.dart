import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../lang_controller.dart';

class LangBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LanguageController(), permanent: true);
  }
}
