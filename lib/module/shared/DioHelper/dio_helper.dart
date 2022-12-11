import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'http://192.168.0.102/sboba_v3/api', //http://192.168.0.102
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }));
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      error: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? option}) async {
    return await dio.get(url,
        queryParameters: query, options: Options(headers: option));
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      Map<String, dynamic>? option}) async {
    return await dio.post(url,
        queryParameters: query, data: data, options: Options(headers: option));
  }

  static Future<Response> postData1(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? option,
      required FormData data}) async {
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
      options: Options(
        headers: option,
      ),
    );
  }

  static Future<Response> deleteData(
      {required String url, id, Map<String, dynamic>? option}) async {
    return await dio.delete(url,
        options: Options(headers: option, method: "put"));
  }

  static Future<Response?> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    Map<String, dynamic>? option,
  }) async {
    return await dio.put(url,
        queryParameters: query, data: data, options: Options(headers: option));
  }

  static Future<Response?> updateFormData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? option,
  }) async {
    return await dio.put(url,
        queryParameters: query,
        data: data,
        options: Options(
          headers: option,
        ));
  }

  static Future<Response?> putDataForm(
      {required String url,
      Map<String, dynamic>? query,
      required FormData data,
      Map<String, dynamic>? option,
      String? method}) async {
    return await dio.post(url,
        queryParameters: query,
        data: data,
        options: Options(headers: option, method: method));
  }

  static Future<Response?> putDataFormm(
      {required String url,
      Map<String, dynamic>? query,
      required FormData data,
      Map<String, dynamic>? option,
      String? method}) async {
    return await dio.post(url,
        queryParameters: query,
        data: data,
        options: Options(headers: option, method: 'PUT'));
  }
}
