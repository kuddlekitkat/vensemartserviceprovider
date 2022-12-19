import 'dart:io';

import 'dart:convert' as convert;
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../core/session_manager.dart';

mixin ApiServices {
  static final Map<String, String> _requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Dio> getDio() async {
    Dio dio;
    String baseUrl = 'https://api.vensemart.com/api/';

    BaseOptions _options = BaseOptions(
      baseUrl: baseUrl,
      headers: _requestHeaders,
      connectTimeout: 200000,
      receiveTimeout: 200000,
    );

    dio = Dio(_options);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    // const bool isProduction = bool.fromEnvironment('dart.vm.product');
    // if (!isProduction) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    // }

    return dio;
  }

  Future<Response?> apiPostRequests(
      String endPoint, Map<String, dynamic> credentials,
      {Map<String, dynamic>? header}) async {
    try {
      header ??= {};
      Dio dio = await getDio();
      Response response = await dio.post(endPoint,
          data: credentials,
          options: Options(headers: {
            // ignore: prefer_interpolation_to_compose_strings
            "Authorization": "Bearer " + await getAuthToken(),
            ...header
          }));
      return response;
    } on DioError catch (e) {
      // debugPrint("e.toString()");
      print(e.toString());
      // return "";
      return e.response;
    }
  }

  Future<Response?> apiGetRequests(String endPoint) async {
    try {
      Dio dio = await getDio();
      Response response = await dio.get(endPoint,
          options: Options(
              headers: {"Authorization": "Bearer " + await getAuthToken()}));
      //  debugPrint(response.data.toString());
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  getAuthToken() async {
      String? accessToken = SessionManager.instance.authToken;
      return accessToken;
  }
}
