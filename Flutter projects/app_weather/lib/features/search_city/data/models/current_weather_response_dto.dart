import 'package:app_weather/features/search_city/data/models/current_weather_location_response_dto.dart';
import 'package:equatable/equatable.dart';

import 'current_weather_current_response_dto.dart';

class CurrentWeatherResponseDto extends Equatable{
  final CurrentWeatherLocationResponseDto location;
  final CurrentWeatherCurrentResponseDto current;

  const CurrentWeatherResponseDto(
      {required this.location, required this.current});

  factory CurrentWeatherResponseDto.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherResponseDto(
      location: CurrentWeatherLocationResponseDto.fromJson(json['location']),
      current: CurrentWeatherCurrentResponseDto.fromJson(json['current']),
    );
  }

  @override
  String toString() {
    return 'CurrentWetherLocationResponseDto{location: $location, current: $current}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    location,
    current,
  ];
}
