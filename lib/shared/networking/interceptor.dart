import 'package:dio/dio.dart';

class KInterceptor extends Interceptor {
  KInterceptor(Dio dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    /// If API needs an authorization token, we can add it to the request here!
    /// options.headers.addAll({'Authorization': 'Bearer $token'});
    return handler.next(options); //continue
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
