// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "appName": "Weather App",
  "generalError": "حدث خطأ.. الرجاء المحاولة في وقت لاحق",
  "emptyResponse": "لايوجد نتائج لعرضها",
  "SomethingIsWrong": "هناك شي خاطئ",
  "ResentCode": "تم إرسال الرمز بنجاح"
};
static const Map<String,dynamic> en = {
  "appName": "Weather App",
  "generalError": "Error happened, please try later!",
  "emptyResponse": "Empty Response",
  "SomethingIsWrong": "Something is wrong",
  "ResentCode": "Resent Code Successfully"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
