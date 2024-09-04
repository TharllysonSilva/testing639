import 'package:testing639/models/current_model.dart';

class WeatherResponse {
  final double lat;
  final double lon;
  final String timezone;
  final double timezoneOffSet;
  final CurrentModel currentModel;

  WeatherResponse(
      {required this.lat,
      required this.lon,
      required this.timezone,
      required this.timezoneOffSet,
      required this.currentModel});
  factory WeatherResponse.fromJson(Map<String, dynamic>? json) {
    return WeatherResponse(
      lat: json?['lat'] ?? 0.0,
      lon: json?['lon'] ?? 0.0,
      timezone: json?['timezone'] ?? '',
      timezoneOffSet: json?['timezone_offset'] ?? 0.0,
      currentModel: CurrentModel.fromJson(json?['current'] ?? 0.0),
    );
  }
}
