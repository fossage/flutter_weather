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

capitalize(String s) => s[0].toUpperCase() + s.substring(1);

getTextStyle(
    {fontSize = 14.0, color = Colors.white, fontWeight = FontWeight.w600}) {
  return TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
}
