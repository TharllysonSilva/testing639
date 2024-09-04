class CurrentWeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  CurrentWeatherModel(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic>? json) {
    return CurrentWeatherModel(
        id: json?['id'] ?? 0,
        main: json?['main'] ?? '',
        description: json?['description'] ?? '',
        icon: json?['icon'] ?? '');
  }
}
