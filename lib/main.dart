import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'utils.dart';
import 'fetch-weather.dart';
import 'forecast.dart';
import './header/header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          backgroundColor: Color.fromRGBO(24, 68, 109, 1),
          body: MyAppContainer()),
    );
  }
}

class MyAppContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyAppContainer> {
  String _city = 'Seattle';
  String _date = formattedDate();
  CurrentWeatherItem _currentWeather;
  List<ForecastDataItem> _forecast;

  MyAppState() : super() {
    new Timer.periodic(const Duration(seconds: 1),
        (timer) => {setState(() => _date = formattedDate())});

    new Timer.periodic(
        const Duration(seconds: 60), (timer) => {_updateCurrentWeather(_city)});

    _updateForecast(_city);
    _updateCurrentWeather(_city);
  }

  void _updateCurrentWeather(city) async {
    var currentWeather = await FetchWeather.currentWeather(city);
    setState(() => _currentWeather = currentWeather);
  }

  void _updateForecast(city) async {
    var forecast = await FetchWeather.forecast(city);
    setState(() => _forecast = forecast);
  }

  void _handleSubmitCity(city) {
    setState(() => _city = city);
    _updateCurrentWeather(city);
    _updateForecast(city);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Header(
                  formattedDate: _date,
                  currentCity: _city,
                  onSubmitCity: _handleSubmitCity,
                  currentWeatherData: _currentWeather,
                )),
            Expanded(
              flex: 3,
              child: Forecast(
                forecast: _forecast,
              ),
            )
          ],
        ));
  }
}
