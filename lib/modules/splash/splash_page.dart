import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/modules/splash/splash_store.dart';
import 'package:weather_app/shared/helpers/colors.dart';
import 'package:weather_app/shared/helpers/location_helper.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashStore> {
  @override
  void initState() {
    LocationHelper.checkPermission(context, () {
      Timer(const Duration(seconds: 3), () {
        Modular.to.navigate('/home');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KColors.primaryColor,
        body: Center(
          child: Text(
            LocaleKeys.appName.tr(),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 6,
                wordSpacing: 6),
          ),
        ));
  }
}
