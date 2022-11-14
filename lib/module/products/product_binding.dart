import 'package:get/get.dart';
import 'package:sboba_app_client/module/products/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
