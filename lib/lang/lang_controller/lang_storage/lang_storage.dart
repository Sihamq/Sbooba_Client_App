import 'package:get_storage/get_storage.dart';

class LangStorage {
  void saveLanguage(value) async {
    await GetStorage().write('lang', value);
  }

  Future<String?> get selectedLanguage async {
    return GetStorage().read('lang');
  }
}
