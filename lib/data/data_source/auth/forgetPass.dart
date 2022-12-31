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
      );
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
Future OtpData({email,token

})async{
    try {
      FormData formData = FormData.fromMap({"token":token,"email": email});
      var response =

          // print(response);
          await DioHelper.postData1(
        url: ApiLink.sendOtp,
        data: formData,
      );
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
Future restorePass({email,token,password,confirmpassword

})async{
    try {
      FormData formData = FormData.fromMap({"token":token,"email": email,"password":password,"password_confirmation":confirmpassword});
      var response =

          // print(response);
          await DioHelper.postData1(
        url: ApiLink.restorePassword,
        data: formData,
      );
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
