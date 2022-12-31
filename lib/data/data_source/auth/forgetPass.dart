import 'package:dio/dio.dart';
import 'package:sboba_app_client/module/shared/cash_helper.dart';

import '../../../module/shared/DioHelper/dio_helper.dart';
import '../../../module/shared/routes/api_routes.dart';

class ForgetPassdData {
  ForgetPassdData();

  Future ForgetPassword({email}) async {
    try {
      FormData formData = FormData.fromMap({"email": email});
      var response =

          // print(response);
          await DioHelper.postData1(
              url: ApiLink.forgetPassword,
              data: formData,
              option: {
            "Authorization": "Bearer " + await CashHelper.getData("token"),
          });
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
