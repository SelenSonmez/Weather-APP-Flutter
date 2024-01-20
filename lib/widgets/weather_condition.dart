import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/weather_bloc.dart';
import '../constants/colors.dart';

class WeatherConditionWidget extends StatelessWidget {
  WeatherConditionWidget({super.key, required this.condition});
  String condition;

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Text(condition,
        style: TextStyle(
            color: mainPurple,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
            fontSize: 25));
  }
}
