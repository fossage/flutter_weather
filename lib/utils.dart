import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

formattedDate() {
  var date = new DateTime.now();
  var suffix = "th";
  var digit = date.day % 10;
  if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
    suffix = ["st", "nd", "rd"][digit - 1];
  }
  return new DateFormat("MMMM d'$suffix',", "en_US").add_jm().format(date);
}

formattedForecastDate(int dt) {
  var date = DateTime.fromMicrosecondsSinceEpoch(dt);
  return new DateFormat("EEEE, MMMM d").format(date);
}

capitalize(String s) {
  final beforeCapitalLetter = RegExp(r"(?=[A-Z])");
  var strings = s.split(beforeCapitalLetter);
  return strings.map((str) => capitalizeOne(str)).join('');
}

capitalizeOne(String s) => s[0].toUpperCase() + s.substring(1);

getTextStyle(
    {fontSize = 14.0, color = Colors.white, fontWeight = FontWeight.w600}) {
  return TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
}

getIcon(String code) {
  var asset = 'images/';
  if (code == '01d') {
    asset += 'sunny.png';
  } else if (code == '01n') {
    asset += 'moon.png';
  } else if (['02d', '03d', '04d'].contains(code)) {
    asset += 'partly-sunny.png';
  } else if (['02n', '03n', '04n'].contains(code)) {
    asset += 'partly-cloudy-moon.png';
  } else if (code == '10d') {
    asset += 'drizzle.png';
  } else if (code == '13d') {
    asset += 'heavy-snow.png';
  } else if (code == '11d') {
    asset += 'lightning.png';
  } else {
    asset += 'thermometer.png';
  }

  return Image.asset(asset, fit: BoxFit.contain, height: 35.0);
}
