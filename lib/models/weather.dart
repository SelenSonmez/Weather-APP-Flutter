import 'forecast.dart';

class Weather {
  String city;
  String weatherCondition;
  int temperature;
  String imageURL;
  int precipitation;
  int humidity;
  int windSpeed;
  String lastUpdated;
  List<Forecast> forecasts;

  Weather(
      {required this.city,
      required this.weatherCondition,
      required this.temperature,
      required this.imageURL,
      required this.precipitation,
      required this.humidity,
      required this.windSpeed,
      required this.lastUpdated,
      required this.forecasts});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json['location']['name'] as String,
        lastUpdated: DateTime.now().toString(),
        weatherCondition: json['current']['condition']['text'] as String,
        temperature: json['current']['temp_c'].toInt() as int,
        imageURL: "https:" + json['current']['condition']['icon'],
        precipitation: json['forecast']['forecastday'][0]['day']
                ['daily_chance_of_rain']
            .toInt() as int,
        humidity: json['current']['humidity'].toInt() as int,
        windSpeed: json['current']['wind_kph'].toInt() as int,
        forecasts: List<Forecast>.from(json['forecast']['forecastday']
            .map((value) => Forecast.fromJson(value))));
  }

  @override
  String toString() {
    return "$city, $weatherCondition, $temperature, $imageURL, $humidity, $windSpeed, $precipitation, $forecasts";
  }
}
