import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sboba_app_client/module/shared/DioHelper/dio_helper.dart';
import 'package:sboba_app_client/module/shared/routes/api_routes.dart';
import 'package:sizer/sizer.dart';

import '../../../module/my_colors.dart';

class LoginData {
  postData({required String email, required dynamic password}) async {
    try {
      Map<String, dynamic> data = {"email": email, "password": password};
      // FormData formData =
      //     FormData.fromMap({"email": email, "password": password});
      var response =

          // print(response);
          await DioHelper.postData(url: ApiLink.login, data: data);
      if (response.statusCode == 200) {
        print("res...${response.data}");
        return response.data;
      } else {
        response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
