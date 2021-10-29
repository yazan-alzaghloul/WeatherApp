import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/anotherDay/another_day_page.dart';

class AnotherDayModule extends Module {
  static const initialRoute = '/anotherDay';

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AnotherDayPage()),
  ];
}
