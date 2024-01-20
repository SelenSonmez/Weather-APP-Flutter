import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../models/forecast.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key, required this.weather});
  final Forecast weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 80,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [forecastPurple, mainPurple], begin: Alignment.topCenter),
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 7)],
          borderRadius: BorderRadius.circular(35)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(convertDateToDay(weather.day),
              style: const TextStyle(color: Colors.white)),
          Image.network(weather.imageURL),
          Column(
            children: [
              Text("${weather.maxTemp.floor()}°",
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              Text("${weather.minTemp.floor()}°",
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          )
        ]),
      ),
    );
  }

  String convertDateToDay(String date) {
    var splitted = date.split("-");
    var dateTime = DateTime(
        int.parse(splitted[0]), int.parse(splitted[1]), int.parse(splitted[2]));

    var dene = DateFormat('EEEE').format(dateTime);
    return dene[0] + dene[1] + dene[2];
  }
}
