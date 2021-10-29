import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/modules/home/home_store.dart';
import 'package:weather_app/shared/helpers/colors.dart';
import 'package:weather_app/shared/helpers/utils.dart';
import 'package:weather_app/shared/models/weather_response_model.dart';
import 'package:weather_app/shared/widgets/custom_network_image.dart';
import 'package:weather_app/shared/widgets/loader.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    ///Get the current location
    store.getLocation();

    ///Call the weather api
    store.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.backgroundColor,
      body: Observer(builder: (BuildContext context) {
        return Stack(
          children: [
            if (store.weatherResponseModel.daily != null)
              Column(
                children: [
                  CurrentDayWidget(
                      weatherResponseModel: store.weatherResponseModel),
                  OtherDaysWidget(daily: store.weatherResponseModel.daily!)
                ],
              ),
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

class CurrentDayWidget extends StatelessWidget {
  const CurrentDayWidget({Key? key, required this.weatherResponseModel})
      : super(key: key);

  final WeatherResponseModel weatherResponseModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 370,
      width: size.width,
      padding: EdgeInsets.only(top: 50),
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
          Container(
            height: 200,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomNetworkImage(
                      imageUrl: Utils.getWeatherIconUrlFromIconCode(
                          weatherResponseModel.current!.weather![0].icon!,
                          isLarge: true)),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        weatherResponseModel.timezone!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        Utils.convertTempFromKelvinToCelsius(
                            weatherResponseModel.current!.temp!),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 64),
                      ),
                      Text(
                        weatherResponseModel.current!.weather![0].main!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0.5,
            color: Colors.white.withOpacity(0.3),
            thickness: 0.5,
            indent: 16,
            endIndent: 16,
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(LocaleKeys.WindSpeed.tr(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                        Text(
                            " ${weatherResponseModel.current!.windSpeed!.toString()} M/S",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ],
                    )),
                VerticalDivider(
                  width: 0.5,
                  color: Colors.white.withOpacity(0.3),
                  thickness: 0.5,
                  indent: 16,
                  endIndent: 16,
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(LocaleKeys.Humidity.tr(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                        Text(
                            "${weatherResponseModel.current!.humidity!.toString()} %",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ],
                    )),
                VerticalDivider(
                  width: 0.5,
                  color: Colors.white.withOpacity(0.3),
                  thickness: 0.5,
                  indent: 16,
                  endIndent: 16,
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(LocaleKeys.Pressure.tr(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                        Text(weatherResponseModel.current!.pressure!.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OtherDaysWidget extends StatelessWidget {
  const OtherDaysWidget({
    Key? key,
    required this.daily,
  }) : super(key: key);

  final List<Daily> daily;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.separated(
          itemCount: daily.length,
          separatorBuilder: (context, index) {
            return Divider(
              height: 0.5,
              color: Colors.white.withOpacity(0.2),
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
            );
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Modular.to
                  .pushNamed('/anotherDay', arguments: {"Daily": daily[index]}),
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Center(
                            child: Text(
                          Utils.convertToDayFormat(daily[index].dt!)
                              .substring(0, 3)
                              .toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: size.height,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomNetworkImage(
                                    imageUrl:
                                        Utils.getWeatherIconUrlFromIconCode(
                                            daily[index].weather![0].icon!)),
                              ),
                              Expanded(
                                  child: Text(
                                daily[index].weather![0].main!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ))
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Utils.convertTempFromKelvinToCelsius(
                                  daily[index].temp!.morn!),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              Utils.convertTempFromKelvinToCelsius(
                                  daily[index].temp!.eve!),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
