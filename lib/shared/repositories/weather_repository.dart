import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/shared/helpers/constants.dart';
import 'package:weather_app/shared/helpers/error_helper.dart';
import 'package:weather_app/shared/models/weather_response_model.dart';
import 'package:weather_app/shared/networking/weather_app_exception.dart';

class WeatherRepository {
  final Dio _client;

  WeatherRepository(Dio client) : _client = client;

  Future<WeatherResponseModel> getWeather(
      String latitude, String longitude) async {
    try {
      final response = await _client.get('data/2.5/onecall',
          queryParameters: {
            "lat": latitude,
            "lon": longitude,
            "appid": Constants.weatherApiKey
          });
      if (response.statusCode == 200)
        return weatherResponseModelFromJson(json.encode(response.data));
      else
        throw WeatherAppException(LocaleKeys.emptyResponse);
    } on DioError catch (e, s) {
      ErrorHelper.handle(LocaleKeys.SomethingIsWrong, e, s);
    } catch (e) {
      throw WeatherAppException(LocaleKeys.generalError);
    }
    return WeatherResponseModel();
  }
}
