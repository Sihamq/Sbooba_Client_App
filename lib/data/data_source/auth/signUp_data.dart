import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sboba_app_client/data/models/sellser_model.dart';
import 'package:sboba_app_client/module/create_profile_screen/create_controller.dart';
import 'package:sboba_app_client/module/shared/DioHelper/dio_helper.dart';
import 'package:sboba_app_client/module/shared/routes/api_routes.dart';

class SignupData {
  SignupData();
  SellerItem? seller;
  Future postData(
      {required name,
      required email,
      required pasword,
      required confirmPassword,
      required shopname,
      required shopAdress,
      required phone,
      gender,
      required commercial_no,
      cityId,
      latitude,
      longitude,image}) async {
    FormData data = FormData.fromMap({
     
        "name": name,
        "email": email,
        "password": pasword,
        "password_confirmation": confirmPassword,
        "shop_name": shopname,
        "phone": phone,
        "gender": gender,
        "commercial_no": commercial_no,
        "city_id": cityId,
        "address": shopAdress,
        "latitude": latitude,
        "longitude": longitude,
        "image":image

    });

    var response = await DioHelper.postData1(url: ApiLink.register, data: data);
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      response.data;
      print(response.data);
    }
  }
}
