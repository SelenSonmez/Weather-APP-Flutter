part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitialState extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final Weather weather;

  @override
  List<Object> get props => [weather];

  const WeatherLoadedState({required this.weather});
}

final class WeatherErrorState extends WeatherState {}
