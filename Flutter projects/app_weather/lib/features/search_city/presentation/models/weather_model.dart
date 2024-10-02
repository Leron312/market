import 'package:app_weather/features/search_city/presentation/models/weather_current_model.dart';
import 'package:app_weather/features/search_city/presentation/models/weather_location_model.dart';
import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final WeatherLocationModel location;
  final WeatherCurrentModel current;

  const WeatherModel({
    required this.location,
    required this.current,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        location,
        current,
      ];
}
