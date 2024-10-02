import 'package:app_weather/features/search_city/di/city_search_module.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initMainModule(){

  initCitySearchModule();

}