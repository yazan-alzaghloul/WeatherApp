import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/home/home_store.dart';
import 'package:weather_app/shared/widgets/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    ///to get the current location
    store.getLocation();

    ///to call the weather api
    store.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (BuildContext context) {
        return Stack(
          children: [
            Container(),
            if (store.isLoading)
              Loader(
                withBgOverlay: true,
              )
          ],
        );
      }),
    );
  }
}
