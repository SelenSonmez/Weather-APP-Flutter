// ignore_for_file: public_member_api_docs, sort_constructors_first


class Forecast {
  String day;
  String imageURL;
  double maxTemp;
  double minTemp;
  Forecast({
    required this.day,
    required this.imageURL,
    required this.maxTemp,
    required this.minTemp,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      day: json['date'] as String,
      imageURL: "https:" + json['day']['condition']['icon'],
      maxTemp: json['day']['maxtemp_c'] as double,
      minTemp: json['day']['mintemp_c'] as double,
    );
  }

  @override
  String toString() {
    return 'Forecast(day: $day, image: $imageURL, max: $maxTemp, min: $minTemp)';
  }
}
