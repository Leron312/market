import 'package:app_weather/features/search_city/data/mappers/city_search_mapper.dart';
import 'package:app_weather/features/search_city/data/repository/city_search_repository_Impl.dart';
import 'package:app_weather/features/search_city/domain/city_search_interactor.dart';
import 'package:app_weather/features/search_city/domain/repository/city_search_repository.dart';
import 'package:app_weather/features/search_city/presentation/bloc/city_search_bloc.dart';
import 'package:app_weather/features/search_city/presentation/mappers/weather_model_mapper.dart';
import '../../../core/di/main_module.dart';
import '../data/api/city_search_api.dart';

void initCitySearchModule() {
  getIt.registerLazySingleton(() => CitySearchApi());
  getIt.registerFactory(() => CitySearchMapper());
  getIt.registerFactory(() => CitySearchInteractor(getIt()));
  getIt.registerFactory(() => WeatherModelMapper());
  getIt.registerFactory(() => CitySearchBloc(getIt(), getIt()));

  getIt.registerSingleton<CitySearchRepository>(
       CitySearchRepositoryImpl(getIt(), getIt()));
}
