import 'package:equatable/equatable.dart';

class CurrentWeatherLocationResponseDto extends Equatable{
  const CurrentWeatherLocationResponseDto(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lon,
      required this.tzId,
      required this.localtimeEpoch,
      required this.localtime});

  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  factory CurrentWeatherLocationResponseDto.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherLocationResponseDto(
        name: json['name'],
        region: json['region'],
        country: json['country'],
        lat: json['lat'],
        lon: json['lon'],
        tzId: json['tz_id'],
        localtimeEpoch: json['localtime_epoch'],
        localtime: json['localtime']);
  }

  @override
  String toString() {
    return 'CurrentWetherLocationResponseDto{name: $name, region: $region, country: $country, lat: $lat, lon: $lon, tzId: $tzId, localtimeEpoch: $localtimeEpoch, localtime: $localtime,}';
  }

  @override
  // TODO: implement props
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
