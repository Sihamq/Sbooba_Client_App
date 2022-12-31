import 'package:sboba_app_client/module/shared/cash_helper.dart';

import '../../../module/shared/DioHelper/dio_helper.dart';
import '../../../module/shared/routes/api_routes.dart';

class PasswordData {
  PasswordData();

  Future ChangePassword({oldPassword, newPassword, confirmPassword}) async {
    try {
      Map<String, dynamic> data = {
        "password_old": oldPassword,
        "password": newPassword,
        "password_confirmation": confirmPassword
      };
      // FormData formData =
      //     FormData.fromMap({"email": email, "password": password});
      var response =

          // print(response);
          await DioHelper.postData(
              url: ApiLink.changePassword,
              data: data,
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
