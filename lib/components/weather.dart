import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/provider/weather_provider.dart';
import 'package:smart_home/static/app_colors.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

Map<String, String> iconWeather = {
  "Clear sky": "☀",
  "Few clouds": "⛅",
  "Scattered clouds": "🌥",
  "Broken clouds": "☁",
  "Shower rain": "🌦",
  "Rain": "🌧",
  "Thunderstorm": "⛈",
  "Snow": "🌨",
  "Mist": "🌫",
};

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, dataProvider, _) {
        if (dataProvider.isLoadingData!) {
          // print("===Consumer: ${scheduleProvider.loadingData}");
          return LoadingAnimationWidget.hexagonDots(
              color: Colors.white, size: 50);
        } else {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.purplePrimaryColor2,
              // border: Border.all(
              //   color: AppColor.bluePrimaryColor2,
              //   width: 2,
              // )
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        iconWeather[dataProvider.description!] ?? "⛅",
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataProvider.description!,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const Text(
                            "Ha noi, Viet Nam",
                            style: TextStyle(
                              color: AppColors.grayText,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        dataProvider.tempCurrent!,
                        style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "--",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              "Sensible",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              dataProvider.humidity!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            const Text(
                              "Humidity",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              dataProvider.cloud!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            const Text(
                              "Cloud",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              dataProvider.wind!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            const Text(
                              "Wind",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
