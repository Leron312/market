import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_location_response_dto.g.dart';

@JsonSerializable()
class ForecastLocationResponseDto extends Equatable{
  const ForecastLocationResponseDto(
      {required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime});

  @JsonKey(name: 'name', required: false, includeIfNull: false)
  final String? name;

  @JsonKey(name: 'region', required: false, includeIfNull: false)
  final String? region;

  @JsonKey(name: 'country', required: false, includeIfNull: false)
  final String? country;

  @JsonKey(name: 'lat', required: false, includeIfNull: false)
  final double? lat;

  @JsonKey(name: 'lon', required: false, includeIfNull: false)
  final double? lon;

  @JsonKey(name: 'tzId', required: false, includeIfNull: false)
  final String? tzId;

  @JsonKey(name: 'localtimeEpoch', required: false, includeIfNull: false)
  final int? localtimeEpoch;

  @JsonKey(name: 'localtime', required: false, includeIfNull: false)
  final String? localtime;

  factory ForecastLocationResponseDto.fromJson(Map<String, dynamic> json)
   => _$ForecastLocationResponseDtoFromJson(json);

  @override
  String toString() {
    return 'CurrentWetherLocationResponseDto{name: $name, region: $region, country: $country, lat: $lat, lon: $lon, tzId: $tzId, localtimeEpoch: $localtimeEpoch, localtime: $localtime,}';
  }

  @override
  List<Object?> get props => [
    name,
    region,
    country,
    lat,
    lon,
    tzId,
    localtimeEpoch,
    localtime,
  ];
}
