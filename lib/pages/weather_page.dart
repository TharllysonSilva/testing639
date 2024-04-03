import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing639/models/weather_model.dart';
import 'package:testing639/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService('2b37b2d2aff0224dd97e6b35bc709288');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    //get the current city
    String cityName = await _weatherService.getCurrentCity();

    //get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    // any errors
    catch (e) {
      print(e);
    }
  }

  //weather animations

  //init state

  @override
  void initState() {
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city Name
            Text(_weather?.cityName ?? "Loading city.."),

            //animation
            Lottie.asset('assets/cloud.json'),
            //temperature
            Text('${_weather?.temperature.round()}°C'),
          ],
        ),
      ),
    );
  }
}
