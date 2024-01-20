import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:weather_app/data/weather_repository.dart';
import 'package:weather_app/locator.dart';

import '../../models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator.get<WeatherRepository>();

  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());

      try {
        final Weather weather =
            await weatherRepository.getWeather(event.cityName);
        emit(WeatherLoadedState(weather: weather));
      } catch (_) {
        emit(WeatherErrorState());
      }
    });

    on<AppInitialEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final location = await Location().getLocation();
        final Weather weather = await weatherRepository
            .getWeather("${location.latitude},${location.longitude}");
        emit(WeatherLoadedState(weather: weather));
      } catch (e) {
        emit(WeatherErrorState());
      }
    });

    on<RefreshWeatherEvent>((event, emit) async {
      try {
        Weather weather = await weatherRepository.getWeather(event.cityName);
        emit(WeatherLoadedState(weather: weather));
      } catch (e) {
        emit(WeatherErrorState());
      }
    });
  }
}
