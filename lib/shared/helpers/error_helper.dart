import 'package:dio/dio.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/shared/networking/weather_app_exception.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorHelper {
  static handle(String defaultMessageError, DioError e, StackTrace s) {
    try {
      if (e.error is WeatherAppException) throw e.error;
      if (e.response != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        throw WeatherAppException(LocaleKeys.generalError.tr(),
            innerException: e);
      } else {
        throw WeatherAppException(defaultMessageError.tr(), innerException: e);
      }
    } on WeatherAppException catch (_) {
      rethrow;
    } catch (e) {
      throw WeatherAppException(LocaleKeys.generalError.tr(),
          innerException: e);
    }
  }
}
