import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/home/home_page.dart';
import 'package:weather_app/modules/home/home_store.dart';

class HomeModule extends Module {
  static const initialRoute = '/home';

  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
