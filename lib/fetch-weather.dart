import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const API_BASE_PATH = 'https://api.openweathermap.org/data/2.5/';

assembleUrl(String requestType, String location) {
  return "$API_BASE_PATH$requestType?q=$location&mode=json&appid=c36043dd046f0d256302ccfa30d8c6ad&units=imperial";
}

class ForecastDataItem {
  final int dt;
  final String description;
  final String icon;
  final int min;
  final int max;

  ForecastDataItem(
      {@required this.dt,
      @required this.description,
      @required this.icon,
      @required double min,
      @required double max})
      : min = min.round(),
        max = max.round();
}

class CurrentWeatherItem {
  final int current;
  final int min;
  final int max;

  CurrentWeatherItem(
      {@required double current, @required double min, @required double max})
      : current = current.round(),
        min = min.round(),
        max = max.round();
}

class FetchWeather {
  static Future<List<ForecastDataItem>> forecast(String city) async {
    String url = assembleUrl("forecast/daily", city);

    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    var data = json.decode(res.body);
    var list = data['list'] as List;

    return list
        .map((item) => new ForecastDataItem(
            dt: item['dt'],
            description: item['weather'][0]['description'],
            icon: item['weather'][0]['icon'],
            min: item['temp']['min'].toDouble(),
            max: item['temp']['max'].toDouble()))
        .toList();
  }

  static Future<CurrentWeatherItem> currentWeather(String city) async {
    String url = assembleUrl("weather", city);

    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    var data = json.decode(res.body) as Map;
    var temp = data['main'];

    return new CurrentWeatherItem(
        current: temp['temp'].toDouble(),
        min: temp['temp_min'].toDouble(),
        max: temp['temp_max'].toDouble());
  }
}
