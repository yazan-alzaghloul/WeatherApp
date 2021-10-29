import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/anotherDay/another_day_module.dart';
import 'package:weather_app/modules/home/home_module.dart';
import 'package:weather_app/modules/splash/splash_module.dart';
import 'package:weather_app/shared/networking/dio_factory.dart';
import 'package:weather_app/shared/repositories/weather_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => DioFactory.create()),
    Bind((i) => WeatherRepository(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(SplashModule.initialRoute, module: SplashModule()),
    ModuleRoute(HomeModule.initialRoute, module: HomeModule()),
    ModuleRoute(AnotherDayModule.initialRoute, module: AnotherDayModule()),
  ];
}
