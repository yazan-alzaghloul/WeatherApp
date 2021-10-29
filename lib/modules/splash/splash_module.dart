import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/splash/splash_page.dart';
import 'package:weather_app/modules/splash/splash_store.dart';

class SplashModule extends Module {
  static const initialRoute = '/';

  @override
  final List<Bind> binds = [
    Bind((i) => SplashStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
  ];
}
