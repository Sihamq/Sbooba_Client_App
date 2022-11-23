import 'package:get/get.dart';

class OrderController extends GetxController {
  List listItems = ["ALL", "Pending", "Accept"];
  int? selected = 0;
  getSelected(x) {
    selected = x;
    update();
  }

  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int slected = 0;
  selectIndex(index) {
    slected = index;
    update();
  }
}
