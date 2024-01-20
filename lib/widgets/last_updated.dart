import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/colors.dart';

import '../blocs/bloc/weather_bloc.dart';
import '../models/weather.dart';

class LastUpdatedWidget extends StatelessWidget {
  const LastUpdatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        Weather weather = (state as WeatherLoadedState).weather;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Updated: ",
              style: TextStyle(
                  fontSize: 19, color: mainPurple, fontWeight: FontWeight.bold),
            ),
            Text(
              weather.lastUpdated
                  .toString()
                  .split(" ")[1]
                  .split(".")[0]
                  .substring(0, 5),
              style: TextStyle(
                  fontSize: 19, color: mainPurple, fontWeight: FontWeight.bold),
            )
          ],
        );
      },
    );
  }
}
