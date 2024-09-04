import 'package:testing639/models/current_weather_model.dart';

class CurrentModel {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final double windDeg;
  final double windGust;
  final List<CurrentWeatherModel> currentWeatherModel;

  CurrentModel(
      {required this.dt,
      required this.sunrise,
      required this.sunset,
      required this.temp,
      required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.dewPoint,
      required this.uvi,
      required this.clouds,
      required this.visibility,
      required this.windSpeed,
      required this.windDeg,
      required this.windGust,
      required this.currentWeatherModel});

  factory CurrentModel.fromJson(Map<String, dynamic>? json) {
    final listWeather = json?['current'] as List;
    List<CurrentWeatherModel> currentWeathModel =
        listWeather.map((e) => CurrentWeatherModel.fromJson(e)).toList();
    return CurrentModel(
        dt: json?['dt'] ?? 0,
        sunrise: json?['sunrise'] ?? 0,
        sunset: json?['sunset'] ?? 0,
        temp: json?['temp'] ?? 0.0,
        feelsLike: json?['feels_like'] ?? 0.0,
        pressure: json?['pressure'] ?? 0,
        humidity: json?['humidity'] ?? 0,
        dewPoint: json?['dew_point'] ?? 0.0,
        uvi: json?['uvi'] ?? 0,
        clouds: json?['clouds'] ?? 0.0,
        visibility: json?['visibility'] ?? 0,
        windSpeed: json?['wind_speed'] ?? 0.0,
        windDeg: json?['wind_deg'] ?? 0.0,
        windGust: json?['wind_gust'] ?? 0.0,
        currentWeatherModel: currentWeathModel);
  }
}
