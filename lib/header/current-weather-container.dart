import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../utils.dart';
import '../fetch-weather.dart';

class CurrentWeatherContainer extends StatelessWidget {
  CurrentWeatherContainer(
      {this.currentWeatherData, @required this.formattedDate})
      : super(key: ObjectKey(currentWeatherData));

  final CurrentWeatherItem currentWeatherData;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    var min = '';
    var max = '';
    var current = '';

    if (currentWeatherData != null) {
      min = currentWeatherData.min.toString() + 'º';
      max = currentWeatherData.max.toString() + 'º';
      current = currentWeatherData.current.toString() + 'ºF';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(formattedDate, style: getTextStyle()),
        Text('Min $min | Max $max', style: getTextStyle()),
        Text('$current', style: getTextStyle(fontSize: 50.0))
      ],
    );
  }
}
