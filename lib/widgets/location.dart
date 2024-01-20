import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/bloc/weather_bloc.dart';

import '../constants/colors.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({super.key, required this.cityName});
  final TextEditingController _controller = TextEditingController();
  String cityName;

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.location_on, size: 40, color: mainPurple),
          Text(
            cityName,
            style: TextStyle(
                fontSize: 25, color: mainPurple, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Enter City"),
                      content: TextField(
                        onChanged: (value) {
                          cityName = value;
                        },
                        controller: _controller,
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              if (cityName != "") {
                                weatherBloc
                                    .add(FetchWeatherEvent(cityName: cityName));
                              }
                            },
                            child: const Text("Ok"))
                      ],
                    );
                  });
            },
            child: Icon(
              Icons.search,
              size: 30,
              color: mainPurple,
            ),
          ),
        ],
      ),
    );
  }
}
