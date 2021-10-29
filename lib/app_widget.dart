import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarBrightness:
            Brightness.dark, // Dark == white status bar -- for IOS.
        systemNavigationBarColor: Colors.black));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: "/",
      onGenerateTitle: (context) => LocaleKeys.appName.tr(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.white,
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.transparent)),
    ).modular();
  }
}
