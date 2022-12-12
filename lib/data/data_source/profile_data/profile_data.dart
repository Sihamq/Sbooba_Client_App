import 'package:get/get.dart';

import '../../../module/shared/DioHelper/dio_helper.dart';
import '../../../module/shared/cash_helper.dart';
import '../../../module/shared/routes/api_routes.dart';

class ProfileData {
  Future getProfile() async {
    try {
      var response = await DioHelper.getData(url: ApiLink.getProfile, option: {
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

  Future updateData(
      {required name,
      required email,
      required shopname,
      required shopAdress,
      required phone,
      required gender,
      required commercial_no,
      required cityId,
      required latitude,
      required longitude}) async {
    Map<String, dynamic> data = {
      "seller": {
        "name": name,
        "email": email,
        "shop_name": shopname,
        "phone": phone,
        "gender": gender,
        "commercial_no": commercial_no,
        "city_id": cityId,
        "address": shopAdress,
        "latitude": latitude,
        "longitude": longitude
      }
    };

    var response = await DioHelper.putData(
        url: ApiLink.updateProfile,
        data: data,
        option: {
          "Authorization": "Bearer " + await CashHelper.getData("token")
        });
    if (response!.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      response.data;
      print(response.data);
    }
  }
}
