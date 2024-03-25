import 'package:dio/dio.dart';
import 'package:dr_on_call/app/app_prefs.dart';
import 'package:dr_on_call/app/di.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app/constants.dart';

const String applicationJson = "application/json";
const String contentType = "Content-Type";
const String accept = "Accept";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
    };

    AppPreference prefs = instance<AppPreference>();
    String? token = prefs.getToken();

    if (token != null) {
      headers['Authorization'] = 'Bearer $token'; // Add token to headers
    }

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: Constants.apiTimeOut),
      validateStatus: (status) {
        // Allow status codes 200 and 400
        return status == 200 || status == 400 || status == 301;
      },
    );

    if (!kReleaseMode) {
      // It is debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }

    return dio;
  }
}
