import '../../../module/shared/DioHelper/dio_helper.dart';
import '../../../module/shared/cash_helper.dart';
import '../../../module/shared/routes/api_routes.dart';

class OrderData {
  Future getOrder() async {
    try {
      var response = await DioHelper.getData(url: ApiLink.allOrders, option: {
        "Authorization": "Bearer " + await CashHelper.getData("token"),
        "X-localization": await CashHelper.getData("lang")
      });
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
