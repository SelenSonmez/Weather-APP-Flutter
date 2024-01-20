import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherApiClient {
  static const baseUrl = "http://api.weatherapi.com/v1";
  final http.Client httpClient = http.Client();

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/forecast.json?key=62389b0e5ece4994a8f204430241501&q=$cityName&aqi=no&days=3'));

    if (response.statusCode == 200) {
      Weather weather =
          Weather.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      return weather;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
