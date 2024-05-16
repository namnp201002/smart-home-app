import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/components/device_control.dart';
import 'package:smart_home/components/auto_control.dart';
import 'package:smart_home/components/weather.dart';
import 'package:smart_home/provider/control_provider.dart';
import 'package:smart_home/provider/weather_provider.dart';
import 'package:smart_home/provider/test_api_weather.dart';
import 'package:smart_home/static/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Timer? _dataFetchTimer; // Fetch data moi giay


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Fetch data moi giay
    // _dataFetchTimer = Timer.periodic(Duration(seconds: 1), (timer) {
    //   context.read<DataFirebaseProvider>().getData();
    // });
  }

  void updateControl1(bool value) {
    context.read<ControlProvider>().updateControl1(value);
  }

  void updateControl2(value) {
    context.read<ControlProvider>().updateControl2(value);
  }

  void updateControl3(value) {
    context.read<ControlProvider>().updateControl3(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.purplePrimaryColor1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Weather(),
            // const AutoControl(
            //   value: true,
            // ),

            Consumer<ControlProvider>(
              builder: (context, dataFirebaseProvider, _) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: DeviceControl(
                                icon: "💡",
                                device: "Bulb 1",
                                auto: dataFirebaseProvider.control1 == 'tat'
                                    ? false
                                    : true,
                                value: dataFirebaseProvider.led1 == 'tat'
                                    ? false
                                    : true,
                                updateAuto: updateControl1)),
                        Expanded(
                            flex: 1,
                            child: DeviceControl(
                                icon: "💡",
                                device: "Bulb 2",
                                auto: dataFirebaseProvider.control2 == 'tat'
                                    ? false
                                    : true,
                                value: dataFirebaseProvider.led2 == 'tat'
                                    ? false
                                    : true,
                                updateAuto: updateControl2)),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: DeviceControl(
                                icon: "☢️",
                                auto: dataFirebaseProvider.control3 == 'tat'
                                    ? false
                                    : true,
                                device: "Fan",
                                value: dataFirebaseProvider.fan == 'tat'
                                    ? false
                                    : true,
                                updateAuto: updateControl3)),
                        const Expanded(flex: 1, child: SizedBox.shrink()),
                        const SizedBox(
                          width: 115,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),

            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // _getWeather();

                context.read<WeatherProvider>().notifyLoading();
                context.read<WeatherProvider>().init();
                context.read<ControlProvider>().getData();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cyan2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              child: const Text(
                "Refresh Data",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
