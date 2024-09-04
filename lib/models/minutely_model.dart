class MinutelyModel {
  final int dt;
  final int precipitation;

  MinutelyModel({required this.dt, required this.precipitation});

  factory MinutelyModel.fromJson(Map<String, dynamic>? json) {
    return MinutelyModel(
      dt: json?['dt'] ?? 0,
      precipitation: json?['precipitation'] ?? 0,
    );
  }
}
