import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../forecast_condition_dto.dart';

part 'forecast_hour_dto.g.dart';

@JsonSerializable()
class ForecastHourDto extends Equatable {
  const ForecastHourDto(
      {required this.timeEpoch,
      required this.time,
      required this.tempC,
      required this.tempF,
      required this.isDay,
      required this.condition,
      required this.windMph,
      required this.windKph,
      required this.windDegree,
      required this.windDir,
      required this.pressureMb,
      required this.pressureIn,
      required this.precipMm,
      required this.precipIn,
      required this.snowCm,
      required this.humidity,
      required this.cloud,
      required this.feelslikeC,
      required this.feelslikeF,
      required this.windchillC,
      required this.windchillF,
      required this.heatindexC,
      required this.heatindexF,
      required this.dewpointC,
      required this.dewpointF,
      required this.willItRain,
      required this.chanceOfRain,
      required this.willItSnow,
      required this.chanceOfSnow,
      required this.visKm,
      required this.visMiles,
      required this.gustMph,
      required this.gustKph,
      required this.uv});

  @JsonKey(name: 'time_epoch', includeIfNull: false, required: false)
  final int? timeEpoch;

  @JsonKey(name: 'time', includeIfNull: false, required: false)
  final String? time;

  @JsonKey(name: 'temp_c', includeIfNull: false, required: false)
  final double? tempC;

  @JsonKey(name: 'temp_f', includeIfNull: false, required: false)
  final double? tempF;

  @JsonKey(name: 'is_day', includeIfNull: false, required: false)
  final int isDay;

  @JsonKey(name: 'condition', includeIfNull: false, required: false)
  final ForecastConditionDto condition;

  @JsonKey(name: 'wind_mph', includeIfNull: false, required: false)
  final double? windMph;

  @JsonKey(name: 'wind_kph', includeIfNull: false, required: false)
  final double? windKph;

  @JsonKey(name: 'wind_degree', includeIfNull: false, required: false)
  final int? windDegree;

  @JsonKey(name: 'wind_dir', includeIfNull: false, required: false)
  final String? windDir;

  @JsonKey(name: 'pressure_mb', includeIfNull: false, required: false)
  final double? pressureMb;

  @JsonKey(name: 'pressure_in', includeIfNull: false, required: false)
  final double? pressureIn;

  @JsonKey(name: 'precip_mm', includeIfNull: false, required: false)
  final double? precipMm;

  @JsonKey(name: 'precip_in', includeIfNull: false, required: false)
  final double? precipIn;

  @JsonKey(name: 'snow_cm', includeIfNull: false, required: false)
  final double? snowCm;

  @JsonKey(name: 'humidity', includeIfNull: false, required: false)
  final int? humidity;

  @JsonKey(name: 'cloud', includeIfNull: false, required: false)
  final int? cloud;

  @JsonKey(name: 'feelslike_c', includeIfNull: false, required: false)
  final double? feelslikeC;

  @JsonKey(name: 'feelslike_f', includeIfNull: false, required: false)
  final double? feelslikeF;

  @JsonKey(name: 'windchill_c', includeIfNull: false, required: false)
  final double? windchillC;

  @JsonKey(name: 'windchill_f', includeIfNull: false, required: false)
  final double? windchillF;

  @JsonKey(name: 'heatindex_c', includeIfNull: false, required: false)
  final double? heatindexC;

  @JsonKey(name: 'heatindex_f', includeIfNull: false, required: false)
  final double? heatindexF;

  @JsonKey(name: 'dewpoint_c', includeIfNull: false, required: false)
  final double? dewpointC;

  @JsonKey(name: 'dewpoint_f', includeIfNull: false, required: false)
  final double? dewpointF;

  @JsonKey(name: 'will_it_rain', includeIfNull: false, required: false)
  final int? willItRain;

  @JsonKey(name: 'chance_of_rain', includeIfNull: false, required: false)
  final int? chanceOfRain;

  @JsonKey(name: 'will_it_snow', includeIfNull: false, required: false)
  final int? willItSnow;

  @JsonKey(name: 'chance_of_snow', includeIfNull: false, required: false)
  final int? chanceOfSnow;

  @JsonKey(name: 'vis_km', includeIfNull: false, required: false)
  final double? visKm;

  @JsonKey(name: 'vis_miles', includeIfNull: false, required: false)
  final double? visMiles;

  @JsonKey(name: 'gust_mph', includeIfNull: false, required: false)
  final double? gustMph;

  @JsonKey(name: 'gust_kph', includeIfNull: false, required: false)
  final double? gustKph;

  @JsonKey(name: 'uv', includeIfNull: false, required: false)
  final int? uv;

  factory ForecastHourDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastHourDtoFromJson(json);

  @override
  String toString() {
    return 'ForecastHourDto{ timeEpoch: $timeEpoch, time: $time, tempC: $tempC, tempF: $tempF,isDay: $isDay, condition: $condition, windMph: $windMph, windKph: $windKph, windDegree: $windDegree, windDir: $windDir, pressureMb: $pressureMb, pressureIn: $pressureIn, precipMm: $precipMm, precipIn: $precipIn, snowCm: $snowCm, humidity: $humidity, cloud: $cloud, feelslikeC: $feelslikeC, feelslikeF: $feelslikeF, windchillC: $windchillC, windchillF: $windchillF, heatindexC: $heatindexC, heatindexF: $heatindexF, dewpointC: $dewpointC, dewpointF: $dewpointF, willItRain: $willItRain, chanceOfRain: $chanceOfRain, willItSnow: $willItSnow, chanceOfSnow: $chanceOfSnow, visKm: $visKm, visMiles: $visMiles, gustMph: $gustMph, gustKph: $gustKph, uv: $uv}';
  }

  @override
  List<Object?> get props => [
        timeEpoch,
        time,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        snowCm,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        windchillC,
        windchillF,
        heatindexC,
        heatindexF,
        dewpointC,
        dewpointF,
        willItRain,
        chanceOfRain,
        willItSnow,
        chanceOfSnow,
        visKm,
        visMiles,
        gustMph,
        gustKph,
        uv
      ];
}
