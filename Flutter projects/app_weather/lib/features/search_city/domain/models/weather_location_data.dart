import 'package:equatable/equatable.dart';

class WeatherLocationData extends Equatable {
  const WeatherLocationData(
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

  @override
  String toString() {
    return 'WeatherLocationData{name: $name, region: $region, country: $country, lat: $lat, lon: $lon, tzId: $tzId, localtimeEpoch: $localtimeEpoch, localtime: $localtime}';
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
