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
                  flex: 3,
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
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('icon',
                          style: getTextStyle(
                              fontSize: 12.0, color: Colors.black)),
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
