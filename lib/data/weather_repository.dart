import 'package:weather_app/data/weather_api_client.dart';

import '../locator.dart';
import '../models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<Weather> getWeather(String cityName) async {
    return await weatherApiClient.getWeather(cityName);
  }
}
