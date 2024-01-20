import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/widgets/last_updated.dart';
import 'blocs/bloc/weather_bloc.dart';
import 'constants/background_decoration.dart';
import 'constants/colors.dart';
import 'models/weather.dart';
import 'widgets/forecast.dart';
import 'widgets/location.dart';
import 'widgets/weather_information.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      builder: (context, state) {
        Weather weather = (state as WeatherLoadedState).weather;
        return RefreshIndicator(
          onRefresh: () async {
            weatherBloc.add(RefreshWeatherEvent(cityName: weather.city));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(158, 174, 251, 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 550.0),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "3 day forecast",
                                  style: TextStyle(
                                      fontSize: 20, color: forecastPurple),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: weather.forecasts.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: ForecastWidget(
                                          weather: weather.forecasts[index]),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.37,
                  decoration: backgroundDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocationWidget(cityName: weather.city),
                      const LastUpdatedWidget(),
                      Image.network(weather.imageURL,
                          width: 120, height: 112, fit: BoxFit.cover),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(weather.temperature.toString(),
                              style: TextStyle(
                                fontSize: 150,
                                height: 0,
                                color: mainPurple,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -15,
                                shadows: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5,
                                  )
                                ],
                              )),
                          Text("°",
                              style: TextStyle(
                                  shadows: const [BoxShadow(blurRadius: 2)],
                                  fontSize: 70,
                                  color: mainPurple)),
                        ],
                      ),
                      Container(
                        width: 330,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.white54,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                WeatherInformationWidget(
                                    percent: "${weather.precipitation}%",
                                    icon: FontAwesomeIcons.umbrella,
                                    explanation: "Precipitation"),
                                WeatherInformationWidget(
                                  percent: "${weather.humidity}%",
                                  icon: FontAwesomeIcons.droplet,
                                  explanation: "Humidty",
                                ),
                                WeatherInformationWidget(
                                  percent: "${weather.windSpeed}km/h",
                                  icon: FontAwesomeIcons.wind,
                                  explanation: "Wind Speed",
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
