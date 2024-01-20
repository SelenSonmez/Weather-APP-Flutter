import 'package:flutter/material.dart';

import '../constants/colors.dart';

class WeatherInformationWidget extends StatelessWidget {
  const WeatherInformationWidget(
      {super.key,
      required this.explanation,
      required this.icon,
      required this.percent});
  final String explanation;
  final IconData icon;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: mainPurple,
        ),
        Text(
          percent,
          style: TextStyle(
              color: mainPurple, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Text(explanation, style: TextStyle(color: mainPurple, fontSize: 13))
      ],
    );
  }
}
