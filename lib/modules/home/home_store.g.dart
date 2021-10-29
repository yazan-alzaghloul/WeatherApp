// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_HomeStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$weatherResponseModelAtom =
      Atom(name: '_HomeStoreBase.weatherResponseModel');

  @override
  WeatherResponseModel get weatherResponseModel {
    _$weatherResponseModelAtom.reportRead();
    return super.weatherResponseModel;
  }

  @override
  set weatherResponseModel(WeatherResponseModel value) {
    _$weatherResponseModelAtom.reportWrite(value, super.weatherResponseModel,
        () {
      super.weatherResponseModel = value;
    });
  }

  final _$userLocationAtom = Atom(name: '_HomeStoreBase.userLocation');

  @override
  Position? get userLocation {
    _$userLocationAtom.reportRead();
    return super.userLocation;
  }

  @override
  set userLocation(Position? value) {
    _$userLocationAtom.reportWrite(value, super.userLocation, () {
      super.userLocation = value;
    });
  }

  final _$getLocationAsyncAction = AsyncAction('_HomeStoreBase.getLocation');

  @override
  Future<void> getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  final _$getWeatherAsyncAction = AsyncAction('_HomeStoreBase.getWeather');

  @override
  Future<void> getWeather() {
    return _$getWeatherAsyncAction.run(() => super.getWeather());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
weatherResponseModel: ${weatherResponseModel},
userLocation: ${userLocation}
    ''';
  }
}
