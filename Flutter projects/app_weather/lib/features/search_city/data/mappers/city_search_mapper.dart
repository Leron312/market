
import '../../domain/models/weather_condition_data.dart';
import '../../domain/models/weather_current_data.dart';
import '../../domain/models/weather_data.dart';
import '../../domain/models/weather_location_data.dart';
import '../models/current_weather_current_response_dto.dart';
import '../models/current_weather_location_response_dto.dart';
import '../models/current_weather_response_dto.dart';
import '../models/weather_condition_response_dto.dart';

class CitySearchMapper {
  WeatherData mapToWeatherData(CurrentWeatherResponseDto dto) {
    final location = dto.location;
    final current = dto.current;
    return WeatherData(
      location: location == null ? null : mapWeatherLocationData(location),
      current: current == null ? null : mapWeatherCurrentData(current),
    );
  }
}

WeatherLocationData mapWeatherLocationData(
    CurrentWeatherLocationResponseDto dto) {
  return WeatherLocationData(
    name: dto.name,
    region: dto.region,
    country: dto.country,
    lat: dto.lat,
    lon: dto.lon,
    tzId: dto.tzId,
    localtimeEpoch: dto.localtimeEpoch,
    localtime: dto.localtime,
  );
}

WeatherCurrentData mapWeatherCurrentData(CurrentWeatherCurrentResponseDto dto) {
  final condition = dto.condition;
  return WeatherCurrentData(
    lastUpdatedEpoch: dto.lastUpdatedEpoch,
    lastUpdated: dto.lastUpdated,
    tempC: dto.tempC,
    tempF: dto.tempF,
    condition: condition != null ? mapWeatherConditionData(condition) : null,
    winMgh: dto.winMgh,
    winKph: dto.visKm,
    windDir: dto.windDir,
    pressureMd: dto.pressureMd,
    precipIn: dto.pressureIn,
    humidity: dto.humidity,
    cloud: dto.cloud,
    feelslikeC: dto.feelslikeC,
    feelslikeF: dto.feelslikeF,
    visKm: dto.visKm,
    wintDegree: dto.wintDegree,
    pressureIn: dto.pressureIn,
    precipMm: dto.precipMm,
    visMiles: dto.visMiles,
    uv: dto.uv,
  );
}

WeatherConditionData mapWeatherConditionData(WeatherConditionResponseDto? dto) {
  return WeatherConditionData(code: dto?.code, text: dto?.text, icon: dto?.icon);
}
