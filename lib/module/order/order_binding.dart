import 'package:get/get.dart';
import 'package:sboba_app_client/module/order/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderController);
  }
}
