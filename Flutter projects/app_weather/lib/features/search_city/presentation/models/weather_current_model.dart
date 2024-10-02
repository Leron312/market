import 'package:app_weather/features/search_city/presentation/models/weather_condition_state.dart';
import 'package:equatable/equatable.dart';

class WeatherCurrentModel extends Equatable {
  const WeatherCurrentModel({
    required this.precipIn,
    required this.lastUpdated,
    required this.tempC,
    required this.condition,
    required this.winKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMd,
    required this.precipMm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.visKm,
  });

  final String lastUpdated;
  final double tempC;
  final WeatherConditionState condition;
  final double winKph;
  final int windDegree;
  final String windDir;
  final double pressureMd;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double visKm;

  @override
  List<Object?> get props => [
        lastUpdated,
        tempC,
        condition,
        winKph,
        windDegree,
        windDir,
        pressureMd,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        visKm,
        precipIn
      ];
}
