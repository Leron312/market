import '../../domain/models/weather_data.dart';
import '../../domain/repository/city_search_repository.dart';
import '../api/city_search_api.dart';
import '../mappers/city_search_mapper.dart';

class CitySearchRepositoryImpl implements CitySearchRepository {
  final CitySearchApi _citySearchApi;
  final CitySearchMapper _citySearchMapper;


  CitySearchRepositoryImpl(this._citySearchApi, this._citySearchMapper);

  @override
  Future<WeatherData?> fetchCurrentWeatherData({required String query}) async {
    final data = await _citySearchApi.fetchCurrentWeatherData(query: query);
    if (data == null) return null;
    return _citySearchMapper.mapToWeatherData(data);

    // return _citySearchApi
    //     .fetchCurrentWeatherData(query: query)
    //     .then((value) => value != null ? _citySearchMapper.mapWeatherData(value) : null);
  }
}
