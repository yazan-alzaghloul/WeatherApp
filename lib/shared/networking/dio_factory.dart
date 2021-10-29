import 'package:dio/dio.dart';

import 'interceptor.dart';

class DioFactory {
  static const BaseUrl = 'https://api.openweathermap.org/';

  static Dio create() {
    final baseOptions = BaseOptions(baseUrl: BaseUrl);
    final dio = Dio(baseOptions);
    dio.interceptors.add(KInterceptor(dio));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }
}
