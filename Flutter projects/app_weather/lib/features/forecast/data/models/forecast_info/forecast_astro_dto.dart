import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_astro_dto.g.dart';

@JsonSerializable()
class ForecastAstroDto extends Equatable {
  const ForecastAstroDto({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  @JsonKey(name: 'sunrise', includeIfNull: false)
  final String? sunrise;

  @JsonKey(name: 'sunset', includeIfNull: false)
  final String? sunset;

  @JsonKey(name: 'moonrise', includeIfNull: false)
  final String? moonrise;

  @JsonKey(name: 'moonset', includeIfNull: false)
  final String? moonset;

  @JsonKey(name: 'moon_phase', includeIfNull: false)
  final String? moonPhase;

  @JsonKey(name: 'moon_illumination', includeIfNull: false)
  final int? moonIllumination;

  @JsonKey(name: 'is_moon_up', includeIfNull: false)
  final int? isMoonUp;

  @JsonKey(name: 'is_sun_up', includeIfNull: false)
  final int? isSunUp;

  factory ForecastAstroDto.fromJson(Map<String, dynamic> json) => _$ForecastAstroDtoFromJson(json);

  @override
  String toString() {
    return 'ForecastAstroDto{sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moonPhase: $moonPhase, moonIllumination: $moonIllumination, isMoonUp: $isMoonUp, isSunUp: $isSunUp}';
  }

  @override
  List<Object?> get props => [
    sunrise,
    sunset,
    moonrise,
    moonset,
    moonPhase,
    moonIllumination,
    isMoonUp,
    isSunUp,
  ];
}
