import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing639/components/my_drawer.dart';
import 'package:testing639/models/weather_response.dart';
import 'package:testing639/screens/profile_page.dart';
import 'package:testing639/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('f2c3efe91d148e757aea0a6d8b50b26f');
  WeatherResponse? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mis':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
        return 'assets/rain.json';
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      case 'snowing':
        return 'assets/snowing.json';
      default:
        return 'assets/sunny.json';
    }
  }

  //init state

  @override
  void initState() {
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToProfilePage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signUserOut,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city Name
            Text(_weather?.timezone ?? "Loading city.."),

            //animation
            Lottie.asset(getWeatherAnimation(
                _weather?.currentModel.currentWeatherModel.first.main)),

            //temperature
            Text('${_weather?.currentModel.temp.round()}°C'),

            //weather condition
            Text(_weather?.currentModel.currentWeatherModel.first.main ?? ""),
          ],
        ),
      ),
    );
  }
}
