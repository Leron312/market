import 'package:app_weather/features/search_city/domain/models/weather_location_data.dart';

import 'weather_current_data.dart';

class WeatherData {
  final WeatherLocationData? location;
  final WeatherCurrentData? current;

  WeatherData(
      {required this.location, required this.current});

  @override
  String toString() {
    return 'WeatherData{location: $location, current: $current}';
  }

  @override
  List<Object?> get props => [
    location,
    current,
  ];
}
