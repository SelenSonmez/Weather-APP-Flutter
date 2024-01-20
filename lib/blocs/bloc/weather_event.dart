part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;
  const FetchWeatherEvent({required this.cityName});
}

class AppInitialEvent extends WeatherEvent {}

class RefreshWeatherEvent extends WeatherEvent {
  final String cityName;
  const RefreshWeatherEvent({required this.cityName});
}
