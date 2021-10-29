import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

class LocationHelper {
  static checkPermission(BuildContext context, Function doSomeThing) async {
    Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (status == ServiceStatus.enabled) {
        doSomeThing();
      }
    });
    await Geolocator.requestPermission().then((value) {
      if (value == LocationPermission.whileInUse ||
          value == LocationPermission.always) {
        Geolocator.isLocationServiceEnabled().then((value) {
          if (!value) {
            Geolocator.openLocationSettings();
          } else {
            doSomeThing();
          }
        });
      } else if (value == LocationPermission.denied) {
        Geolocator.requestPermission();
      } else if (value == LocationPermission.deniedForever) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Can't get current location!"),
                content: const Text(
                    'Please make sure you grant location permission to the app.'),
                actions: <Widget>[
                  ElevatedButton(
                      child: Text('Go'),
                      onPressed: () {
                        Geolocator.openAppSettings().then((value) {
                          Geolocator.requestPermission().then((value) {
                            if (value == LocationPermission.whileInUse ||
                                value == LocationPermission.always) {
                              Geolocator.isLocationServiceEnabled()
                                  .then((value) {
                                if (!value) {
                                  Geolocator.openLocationSettings();
                                } else {
                                  doSomeThing();
                                }
                              });
                            }
                          });
                        });
                        Modular.to.pop();
                      })
                ],
              );
            });
      }
    });
  }

  static Future<Position> getLocation() async {
    Position currentLocation;
    try {
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = Position(
          latitude: 0.0,
          longitude: 0.0,
          timestamp: null,
          heading: 0.0,
          altitude: 0.0,
          speed: 0.0,
          accuracy: 0.0,
          speedAccuracy: 0.0);
      throw Exception(LocaleKeys.generalError);
    }
    return currentLocation;
  }
}
