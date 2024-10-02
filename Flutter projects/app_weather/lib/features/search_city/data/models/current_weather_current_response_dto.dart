import 'package:app_weather/features/search_city/data/models/weather_condition_response_dto.dart';
import 'package:equatable/equatable.dart';

class CurrentWeatherCurrentResponseDto extends Equatable {
  const CurrentWeatherCurrentResponseDto(
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
  final WeatherConditionResponseDto? condition;
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
  final double?  feelslikeC;
  final double? feelslikeF;
  final double? visKm;
  final double? visMiles;
  final double? uv;

  factory CurrentWeatherCurrentResponseDto.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherCurrentResponseDto(
      lastUpdatedEpoch: json['last_updated_epoch'],
      lastUpdated: json['last_updated'],
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      condition: WeatherConditionResponseDto.fromJson(json['condition']),
      winMgh: json['wind_mph'],
      winKph: json['wind_kph'],
      wintDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMd: json['pressure_mb'],
      pressureIn: json['pressure_in'],
      precipMm: json['precip_mm'],
      precipIn: json['precip_in'],
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: json['feelslike_c'],
      feelslikeF: json['feelslike_f'],
      visKm: json['vis_km'],
      visMiles: json['vis_miles'],
      uv: json['uv'],
    );
  }

  get code => null;


  @override
  String toString() {
    return 'CurrentWetherCurrentResponseDto{lastUpdatedEpoch: $lastUpdatedEpoch, lastUpdated: $lastUpdated, tempC: $tempC, tempF: $tempF, condition: $condition, winMgh: $winMgh, winKph: $winKph, wintDegree: $wintDegree, windDir: $windDir, pressureMd: $pressureMd, pressureIn: $pressureIn, precinMn: $precipMm, precinIn: $precipIn, humidity: $humidity, cloud: $cloud, feelslikeC: $feelslikeC, feelslikeF: $feelslikeF, visKm: $visKm, visMiless: $visMiles, uv: $uv,}';
  }

  @override
  // TODO: implement props
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
