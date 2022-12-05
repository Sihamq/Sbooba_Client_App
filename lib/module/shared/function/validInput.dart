import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "username".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "validemail".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "validphone".tr;
    }
  }

  if (val.isEmpty) {
    return "beempty".tr;
  }

  if (val.length < min) {
    return "${"lessthan ".tr}$min";
  }

  if (val.length > max) {
    return "${"largerthan".tr} $max";
  }
}
