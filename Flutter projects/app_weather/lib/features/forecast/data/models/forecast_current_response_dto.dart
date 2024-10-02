import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'forecast_condition_dto.dart';

part 'forecast_current_response_dto.g.dart';

@JsonSerializable()

class ForecastCurrentResponseDto extends Equatable {
  const ForecastCurrentResponseDto(
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

  @JsonKey(name: 'lastUpdatedEpoch', required: false, includeIfNull: false)
  final int? lastUpdatedEpoch;

  @JsonKey(name: 'lastUpdated', required: false, includeIfNull: false)
  final String? lastUpdated;

  @JsonKey(name: 'tempC', required: false, includeIfNull: false)
  final double? tempC;

  @JsonKey(name: 'tempF', required: false, includeIfNull: false)
  final double? tempF;

  @JsonKey(name: 'condition', required: false, includeIfNull: false)
  final ForecastConditionDto? condition;

  @JsonKey(name: 'winMgh', required: false, includeIfNull: false)
  final double? winMgh;

  @JsonKey(name: 'winKph', required: false, includeIfNull: false)
  final double? winKph;

  @JsonKey(name: 'wintDegree', required: false, includeIfNull: false)
  final int? wintDegree;

  @JsonKey(name: 'windDir', required: false, includeIfNull: false)
  final String? windDir;

  @JsonKey(name: 'pressureMd', required: false, includeIfNull: false)
  final double? pressureMd;

  @JsonKey(name: 'pressureIn', required: false, includeIfNull: false)
  final double? pressureIn;

  @JsonKey(name: 'precipMm', required: false, includeIfNull: false)
  final double? precipMm;

  @JsonKey(name: 'precipIn', required: false, includeIfNull: false)
  final double? precipIn;

  @JsonKey(name: 'humidity', required: false, includeIfNull: false)
  final int? humidity;

  @JsonKey(name: 'cloud', required: false, includeIfNull: false)
  final int? cloud;

  @JsonKey(name: 'feelslikeC', required: false, includeIfNull: false)
  final double?  feelslikeC;

  @JsonKey(name: 'feelslikeF', required: false, includeIfNull: false)
  final double? feelslikeF;

  @JsonKey(name: 'visKm', required: false, includeIfNull: false)
  final double? visKm;

  @JsonKey(name: 'visMiles', required: false, includeIfNull: false)
  final double? visMiles;

  @JsonKey(name: 'uv', required: false, includeIfNull: false)
  final double? uv;

  factory ForecastCurrentResponseDto.fromJson(Map<String, dynamic> json) => _$ForecastCurrentResponseDtoFromJson(json);


  get code => null;


  @override
  String toString() {
    return 'ForecastLocationResponseDto{lastUpdatedEpoch: $lastUpdatedEpoch, lastUpdated: $lastUpdated, tempC: $tempC, tempF: $tempF, condition: $condition, winMgh: $winMgh, winKph: $winKph, wintDegree: $wintDegree, windDir: $windDir, pressureMd: $pressureMd, pressureIn: $pressureIn, precinMn: $precipMm, precinIn: $precipIn, humidity: $humidity, cloud: $cloud, feelslikeC: $feelslikeC, feelslikeF: $feelslikeF, visKm: $visKm, visMiless: $visMiles, uv: $uv,}';
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
