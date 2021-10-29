import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app_module.dart';
import 'package:weather_app/app_widget.dart';
import 'package:weather_app/generated/codegen_loader.g.dart';

void main() {
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      saveLocale: true,
      startLocale: Locale('en'),
      useOnlyLangCode: true,
      fallbackLocale: Locale('en'),
      assetLoader: const CodegenLoader(),
      child: ModularApp(module: AppModule(), child: AppWidget())));
}
