import 'package:app_weather/features/search_city/domain/models/weather_condition_data.dart';

class WeatherCurrentData {
  WeatherCurrentData(
      {required this.lastUpdatedEpoch,
      required this.lastUpdated,
      required this.tempC,
      required this.tempF,
      required this.condition,
      required this.winMgh,
      required this.winKph,
      required this.wintDegree,
      required this.windDir,
      required this.pressureMd,
      required this.pressureIn,
      required this.precipMm,
      required this.precipIn,
      required this.humidity,
      required this.cloud,
      required this.feelslikeC,
      required this.feelslikeF,
      required this.visKm,
      required this.visMiles,
      required this.uv});

  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final WeatherConditionData? condition;
  final double? winMgh;
  final double? winKph;
  final int? wintDegree;
  final String? windDir;
  final double? pressureMd;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? visKm;
  final double? visMiles;
  final double? uv;

  @override
  String toString() {
    return 'WeatherCurrentData{lastUpdatedEpoch: $lastUpdatedEpoch, '
        'lastUpdated: $lastUpdated, '
        'tempC: $tempC, '
        'tempF: $tempF, '
        'condition: $condition, '
        'winMgh: $winMgh, '
        'winKph: $winKph, '
        ': $wintDegree,'
        'windDir: $windDir, '
        'pressureMd: $pressureMd, '
        'pressureIn: $pressureIn, '
        'precipMm: $precipMm,'
        'precipIn: $precipIn,'
        'humidity: $humidity,'
        'cloud: $cloud, '
        'feelslikeC: $feelslikeC, '
        'feelslikeF: $feelslikeF, '
        'visKm: $visKm, '
        'visMiles: $visMiles, '
        'uv: $uv,}';
  }

  @override
  List<Object?> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        tempF,
        condition,
        winMgh,
        winKph,
        wintDegree,
        windDir,
        pressureMd,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        visKm,
        visMiles,
        uv,
      ];
}
