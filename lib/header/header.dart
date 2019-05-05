import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../fetch-weather.dart';
import './types.dart';
import './current-weather-container.dart';
import './input-container.dart';

class Header extends StatelessWidget {
  Header(
      {@required this.currentCity,
      @required this.onSubmitCity,
      @required this.formattedDate,
      this.currentWeatherData})
      : super(key: ObjectKey(currentCity));

  final String currentCity;
  final SubmitCityCallback onSubmitCity;
  final String formattedDate;
  final CurrentWeatherItem currentWeatherData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: CurrentWeatherContainer(
          currentWeatherData: currentWeatherData,
          formattedDate: formattedDate,
        )),
        Expanded(
            child: InputContainer(
          onSubmitCity: onSubmitCity,
          currentCity: currentCity,
        ))
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
