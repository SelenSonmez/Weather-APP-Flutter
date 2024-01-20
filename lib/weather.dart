import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/main_screen.dart';

import 'blocs/bloc/weather_bloc.dart';
import 'data/weather_repository.dart';
import 'models/weather.dart';

class WeatherDeneme extends StatefulWidget {
  const WeatherDeneme({super.key});

  @override
  State<WeatherDeneme> createState() => _WeatherDenemeState();
}

class _WeatherDenemeState extends State<WeatherDeneme> {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      body: Center(child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            weatherBloc.add(AppInitialEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherErrorState) {
            return const Center(
              child: Text("Error"),
            );
          }
          if (state is WeatherLoadedState) {
            final currentWeather = state.weather;
            return const MainScreen();
          }
          return const Text("Error Loading States");
        },
      )),
    );
  }
}
