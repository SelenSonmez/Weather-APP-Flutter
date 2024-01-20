# Weather App Flutter

A simple weather App created using [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/) with using API from [WeatherAPI](https://www.weatherapi.com/)</br></br>

<p align="center">
<img src="https://github.com/ArizArmeidi/FlutterWeather/assets/screenshot1" width="20%"></img> 
<img src="https://github.com/ArizArmeidi/FlutterWeather/assets/screenshot2" width="20%"></img> 
<img src="https://github.com/ArizArmeidi/FlutterWeather/assets/screenshot3" width="20%"></img>
</p>

## Features

- <b>Location-based Weather:</b> Get instant weather updates based on the user's current location.
- <b>City Search:</b> Search for weather information in any city worldwide.
- <b>Detailed Weather Data:</b> View maximum and minimum temperatures, humidity,wind speed and more.
- <b>BLoC Pattern:</b> Efficient state management for a smooth user experience.
- <b> WeatherAPI Integration:</b> Utilizes data from [WeatherAPI](https://www.weatherapi.com/) or accurate and up-to-date weather information.

## How to Run

1. Create an account at [WeatherAPI](https://www.weatherapi.com/).
2. Then get your API key from there.
   > Then replace `YOUR_API_KEY` with your own API key from OpenWeatherMap
3. Clone the repo
   ```sh
   git clone https://github.com/SelenSonmez/weather_app.git
   ```
4. Install all the packages by typing
   ```sh
   flutter pub get
   ```
5. Navigate to **lib/data/weather_api_client.dart** and paste your API key to the apiKey variable
   ```dart
   String apiKey = 'Paste Your API Key Here';
   ```
6. Run the App

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
