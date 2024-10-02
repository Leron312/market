import 'package:app_weather/features/search_city/domain/models/weather_data.dart';

abstract class CitySearchRepository {
  Future<WeatherData?> fetchCurrentWeatherData({required String query});
}
