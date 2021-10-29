import 'package:flutter/material.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/shared/helpers/colors.dart';
import 'package:weather_app/shared/helpers/utils.dart';
import 'package:weather_app/shared/models/weather_response_model.dart';
import 'package:weather_app/shared/widgets/custom_network_image.dart';
import 'package:easy_localization/easy_localization.dart';

class AnotherDayPage extends StatefulWidget {
  const AnotherDayPage({Key? key}) : super(key: key);

  @override
  _AnotherDayPageState createState() => _AnotherDayPageState();
}

class _AnotherDayPageState extends State<AnotherDayPage> {
  Daily? daily;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      try {
        final arguments = ModalRoute.of(context)!.settings.arguments as Map;
        setState(() {
          daily = arguments['Daily'];
        });
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: KColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: KColors.primaryColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            if (daily != null)
              Container(
                height: size.height * 0.8,
                width: size.width,
                decoration: BoxDecoration(
                    color: KColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60.0),
                      bottomRight: Radius.circular(60.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: KColors.primaryColor,
                        blurRadius: 16,
                        spreadRadius: 3,
                        offset: const Offset(0.1, 0.1),
                      ),
                    ]),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 200,
                        width: 200,
                        child: CustomNetworkImage(
                            imageUrl: Utils.getWeatherIconUrlFromIconCode(
                                daily!.weather![0].icon!,
                                isLarge: true)),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Center(
                            child: Text(
                          Utils.convertToDayFormat(daily!.dt!).toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w500),
                        ))),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Utils.convertTempFromKelvinToCelsius(
                                  daily!.temp!.morn!),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              " / " +
                                  Utils.convertTempFromKelvinToCelsius(
                                      daily!.temp!.eve!),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            ),
                          ],
                        )),
                    Expanded(
                      child: Text(
                        daily!.weather![0].main!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white.withOpacity(0.2),
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                    Expanded(
                        child: Container(
                      height: size.height * 0.1,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(LocaleKeys.WindSpeed.tr(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  Text("${daily!.windSpeed!.toString()} M/S",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ],
                              )),
                          VerticalDivider(
                            width: 1,
                            color: Colors.white.withOpacity(0.3),
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(LocaleKeys.Humidity.tr(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  Text("${daily!.humidity!.toString()} %",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ],
                              )),
                          VerticalDivider(
                            width: 1,
                            color: Colors.white.withOpacity(0.3),
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(LocaleKeys.Pressure.tr(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  Text(daily!.pressure!.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ],
                              )),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
          ],
        ));
  }
}
