// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:location/location.dart';
// import 'package:weather_app/constants/colors.dart';
// import 'package:weather_app/models/weather.dart';
// import 'package:http/http.dart' as http;

// import 'widgets/weather_information.dart';

// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({super.key});

//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   final Location location = Location();

//   LocationData? _location;

//   Future<Weather> fetchWeather() async {
//     await _getLocation();
//     if (_location != null) {
//       final response = await http.get(Uri.parse(
//           'http://api.weatherapi.com/v1/current.json?key=2e36617a833a4cb7a76214934241101&q=${_location!.latitude},${_location!.longitude}&aqi=no'));
//       if (response.statusCode == 200) {
//         Weather weather =
//             Weather.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//         return weather;
//       } else {
//         throw Exception('Failed to load weather');
//       }
//     } else {
//       return Weather(
//           city: "", weatherCondition: "", temperature: "0", imageURL: "");
//     }
//   }

//   Future<void> _getLocation() async {
//     try {
//       final locationResult = await location.getLocation();
//       _location = locationResult;
//     } on PlatformException catch (err) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//           future: fetchWeather(),
//           builder: (context, snapshot) {
//             List<Widget> children = [];
//             if (snapshot.hasData) {
//               return Container(
//                 height: MediaQuery.of(context).size.height / 1.30,
//                 decoration: BoxDecoration(
//                     boxShadow: [BoxShadow(color: mainPurple, blurRadius: 15)],
//                     borderRadius: BorderRadius.circular(55),
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Color.fromRGBO(208, 211, 255, 1),
//                         Color.fromRGBO(208, 211, 255, 1)
//                       ],
//                     )),
//                 child: Stack(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.location_on,
//                                 size: 40, color: mainPurple),
//                             Text(
//                               snapshot.data!.city,
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color: mainPurple,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         Stack(
//                           alignment: Alignment.topRight,
//                           children: [
//                             Container(
//                               alignment: Alignment.center,
//                               width: 350,
//                               child: Text(
//                                 snapshot.data!.temperature,
//                                 style: TextStyle(
//                                     letterSpacing: -20,
//                                     fontSize: 200,
//                                     fontWeight: FontWeight.bold,
//                                     shadows: const [
//                                       BoxShadow(
//                                         color: Colors.black,
//                                         blurRadius: 5,
//                                       )
//                                     ],
//                                     color: mainPurple),
//                               ),
//                             ),
//                             Positioned(
//                               left: 250,
//                               top: 10,
//                               child: Text(
//                                 " \u00b0",
//                                 style: TextStyle(
//                                     fontSize: 100,
//                                     shadows: const [
//                                       BoxShadow(
//                                           color: Colors.black, blurRadius: 6)
//                                     ],
//                                     color: mainPurple,
//                                     fontWeight: FontWeight.w900),
//                               ),
//                             ),
//                             Positioned(
//                                 right: 10,
//                                 top: 145,
//                                 child: Container(
//                                     width: 150,
//                                     height: 150,
//                                     child: Image.network(
//                                         fit: BoxFit.cover,
//                                         snapshot.data!.imageURL)))
//                           ],
//                         ),
//                         Text(snapshot.data!.weatherCondition,
//                             style: TextStyle(
//                                 color: mainPurple,
//                                 fontWeight: FontWeight.w500,
//                                 letterSpacing: 2,
//                                 fontSize: 25)),
//                         Container(
//                           width: 330,
//                           height: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(45),
//                             color: Colors.white54,
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(15),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   WeatherInformationWidget(
//                                       percent: "20",
//                                       icon: FontAwesomeIcons.umbrella,
//                                       explanation: "Precipitation"),
//                                   WeatherInformationWidget(
//                                     percent: "30",
//                                     icon: FontAwesomeIcons.droplet,
//                                     explanation: "Humidty",
//                                   ),
//                                   WeatherInformationWidget(
//                                     percent: "12",
//                                     icon: FontAwesomeIcons.wind,
//                                     explanation: "Wind Speed",
//                                   )
//                                 ]),
//                           ),
//                         )
//                       ],
//                     ),
//                     Positioned(
//                       top: 590,
//                       child: Container(
//                         child: Text("asdasd"),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               Text("Temperature: ${snapshot.data!.temperature}");
//             } else {
//               CircularProgressIndicator();
//             }

//             return Container();
//           }),
//     );
//   }
// }
