import 'package:app_weather/features/search_city/data/repository/city_search_repository_Impl.dart';
import 'package:app_weather/features/search_city/domain/repository/city_search_repository.dart';

import 'models/weather_data.dart';

class CitySearchInteractor{

  final CitySearchRepository _repository;


  CitySearchInteractor(this._repository);

  Future<WeatherData?> fetchCurrentWeatherData({required String query}) async {
    return _repository.fetchCurrentWeatherData(query: query);
  }
}