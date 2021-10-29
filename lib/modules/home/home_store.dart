import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/shared/helpers/location_helper.dart';
import 'package:weather_app/shared/models/weather_response_model.dart';
import 'package:weather_app/shared/networking/weather_app_exception.dart';
import 'package:weather_app/shared/repositories/weather_repository.dart';
import 'package:weather_app/shared/widgets/toaster.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  WeatherRepository weatherRepository;

  _HomeStoreBase(this.weatherRepository);

  @observable
  bool isLoading = false;

  @observable
  WeatherResponseModel weatherResponseModel = WeatherResponseModel();

  @observable
  Position? userLocation;

  @action
  Future<void> getLocation() async {
    try {
      userLocation = await LocationHelper.getLocation();
    } catch (e) {
      throw WeatherAppException(LocaleKeys.generalError);
    }
  }

  @action
  Future<void> getWeather() async {
    try {
      isLoading = true;
      await getLocation();
      await weatherRepository
          .getWeather(userLocation!.latitude.toString(),
              userLocation!.longitude.toString())
          .then((value) => weatherResponseModel = value);
      isLoading = false;
    } on WeatherAppException catch (e, s) {
      isLoading = false;
      Toaster.error(message: e.message);
    } on DioError catch (e, s) {
      isLoading = false;
      Toaster.error(message: e.message);
    }
  }
}
