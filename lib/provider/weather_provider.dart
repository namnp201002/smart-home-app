import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider extends ChangeNotifier {
  bool? _isLoadingData;
  String? _tempCurrent;
  String? _humidity;
  String? _wind;
  String? _cloud;
  String? _description;
  final _apiKey = 'e69a1e113677e05ca5db46d1825e23b4';

  String? get description => _description;

  bool? get isLoadingData => _isLoadingData;

  String? get humidity => _humidity;

  String? get wind => _wind;

  String? get cloud => _cloud;

  String? get tempCurrent => _tempCurrent;

  WeatherProvider() {
    _isLoadingData = true;
    init();
  }

  void notifyLoadingDone() {
    _isLoadingData = false;
    notifyListeners();
  }

  void notifyLoading() {
    _isLoadingData = true;
    notifyListeners();
  }

  Future<void> init() async {
    try {
      Map<String, dynamic> weatherData = await fetchWeather();

      await Future.delayed(Duration(seconds: 1));
      double tempKelvin = weatherData['main']['temp'];
      _tempCurrent = '${(tempKelvin - 273.15).toStringAsFixed(1)}°';

      int humidity = weatherData['main']['humidity'];
      _humidity = '$humidity%';

      double windSpeedMeterPerSec = weatherData['wind']['speed'];
      _wind = '${(windSpeedMeterPerSec * 3.6).toStringAsFixed(1)}km/h';

      _description =
          weatherData['weather'][0]['description'].toString().capitalize;

      int cloudinessPercentage = weatherData['clouds']['all'];
      _cloud = '$cloudinessPercentage%';
    } catch (error) {
      print('Error initializing weather data: $error');
      _tempCurrent = '-';
      _humidity = '-';
      _wind = '-';
      _cloud = '-';
      // You may call notifyListeners() here as well
    }
    notifyLoadingDone();
  }

  Future<Map<String, dynamic>> fetchWeather() async {
    const double latitude = 21.0278;
    const double longitude = 105.8342;

    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
