import 'package:app_weather/features/search_city/domain/models/weather_condition_data.dart';
import 'package:app_weather/features/search_city/domain/models/weather_current_data.dart';
import 'package:app_weather/features/search_city/domain/models/weather_data.dart';
import 'package:app_weather/features/search_city/domain/models/weather_location_data.dart';
import 'package:app_weather/features/search_city/presentation/models/weather_condition_state.dart';
import 'package:app_weather/features/search_city/presentation/models/weather_location_model.dart';
import 'package:app_weather/features/search_city/presentation/models/weather_model.dart';

import '../models/weather_current_model.dart';

class WeatherModelMapper {
  WeatherModel mapToWeatherData(WeatherData domain) {
    final location = domain.location;
    final current = domain.current;
    return WeatherModel(
      location: location != null
          ? mapWeatherLocationData(location)
          : WeatherLocationModel(
              name: '', region: '', country: '', localtime: ''),
      current: current != null
          ? mapWeatherCurrentData(current)
          : WeatherCurrentModel(
              precipIn: 0,
              lastUpdated: '',
              tempC: 0,
              condition: WeatherConditionState.unknow,
              winKph: 0,
              windDegree: 0,
              windDir: '',
              pressureMd: 0,
              precipMm: 0,
              humidity: 0,
              cloud: 0,
              feelslikeC: 0,
              visKm: 0),
    );
  }
}

WeatherLocationModel mapWeatherLocationData(WeatherLocationData domain) {
  return WeatherLocationModel(
    name: domain.name ?? '',
    region: domain.region ?? '',
    country: domain.country ?? '',
    localtime: domain.localtime ?? '',
  );
}

WeatherCurrentModel mapWeatherCurrentData(WeatherCurrentData domain) {
  final condition = domain.condition;
  return WeatherCurrentModel(
    lastUpdated: domain.lastUpdated ?? '',
    tempC: domain.tempC ?? 0,
    condition: condition != null
        ? mapWeatherConditionData(condition)
        : WeatherConditionState.unknow,
    winKph: domain.visKm ?? 0,
    windDir: domain.windDir ?? '',
    pressureMd: domain.pressureMd ?? 0,
    humidity: domain.humidity ?? 0,
    cloud: domain.cloud ?? 0,
    feelslikeC: domain.feelslikeC ?? 0,
    visKm: domain.visKm ?? 0,
    precipIn: domain.precipIn ?? 0,
    windDegree: domain.wintDegree ?? 0,
    precipMm: domain.precipMm ?? 0,
  );
}

WeatherConditionState mapWeatherConditionData(WeatherConditionData domain) {
  return WeatherConditionState.values.firstWhere(
      (element) => element.code == domain.code,
      orElse: () => WeatherConditionState.unknow);
}
