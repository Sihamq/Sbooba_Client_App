import 'package:dio/dio.dart';
import 'package:sboba_app_client/module/shared/DioHelper/dio_helper.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';
import 'package:sboba_app_client/module/shared/routes/api_routes.dart';

class Productdata {
  Future getProduct() async {
    try {
      var response = await DioHelper.getData(url: ApiLink.getProduct, option: {
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

  Future showSingleProduct(id) async {
    try {
      var response = await DioHelper.getData(
          url: ApiLink.showProduct + "${id}",
          option: {
            "Authorization": "Bearer " + await CashHelper.getData("token")
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

  Future deleteProduct({id}) async {
    try {
      var response = await DioHelper.deleteData(
          url: "/seller/products/${id}",
          option: {
            "Authorization": "Bearer " + await CashHelper.getData("token")
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
