import 'package:get/get.dart';

class OrderController extends GetxController {
  List listItems = ["ALL", "Pending", "Accept"];
  int? selected = 0;
  bool isLoading = false;

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

  // Future getAllOrders() async {
  //   try {
  //     change(productItem.value, status: RxStatus.loading());
  //     isLoading = true;
  //     var res = await Productdata().getProduct();
  //     var pro = res["data"] as List;
  //     if (res["status"] == 200) {
  //       isLoading = false;
  //       productItem.value = pro.map((e) => ProductItem.fromJson(e)).toList();
  //       change(productItem.value, status: RxStatus.success());
  //       print(productItem.length);
  //       if (productItem.isEmpty) {
  //         change(productItem.value, status: RxStatus.empty());
  //       }
  //       product = Product.fromJson(res);
  //       // print(product!.data![0].id);
  //       // print(productItem[0]["name"]);
  //       // update();
  //     } else {
  //       change(productItem.value, status: RxStatus.error());
  //       isLoading = true;
  //       // update();
  //     }
  //   } catch (e) {
  //     change(productItem.value, status: RxStatus.error(e.toString()));
  //     print("something error ${e.toString()}");
  //   }
  // }
}
