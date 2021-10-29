import 'package:easy_localization/easy_localization.dart';
import 'package:weather_app/shared/helpers/constants.dart';
import 'package:weather_app/shared/networking/dio_factory.dart';

class Utils {
  static String convertToDayFormat(int unixTimeStamp) {
    return DateFormat('EEEE')
        .format(DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000));
  }

  static String convertTempFromKelvinToCelsius(double kelvinValue) {
    return (kelvinValue - 273.15).toStringAsFixed(0) + "\u2103";
  }

  static getWeatherIconUrlFromIconCode(String code, {bool isLarge = false}) {
    return isLarge
        ? Constants.iconsBaseURL + "img/wn/$code@2x.png"
        : Constants.iconsBaseURL + "img/wn/$code.png";
  }
}
