import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'utils.dart';
import 'fetch-weather.dart';

class Forecast extends StatelessWidget {
  Forecast({this.forecast}) : super(key: ObjectKey(forecast));

  final List<ForecastDataItem> forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: forecast != null ? (forecast.length * 2) - 1 : 0,
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();

            final index = i ~/ 2;

            var item = forecast[index];
            var min = item.min;
            var max = item.max;

            return Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(formattedForecastDate(item.dt * 1000000)),
                      Text(capitalize(item.description),
                          style:
                              getTextStyle(fontSize: 16.0, color: Colors.black))
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      getIcon(item.icon),
                      Column(
                        children: <Widget>[
                          Text(
                            "$min º",
                            style: getTextStyle(
                                fontSize: 12.0, color: Colors.black),
                          ),
                          Text(
                            "$max º",
                            style: getTextStyle(
                                fontSize: 12.0, color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
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
