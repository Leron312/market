import 'package:app_weather/features/search_city/domain/city_search_interactor.dart';
import 'package:app_weather/features/search_city/presentation/mappers/weather_model_mapper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/weather_model.dart';

part 'city_search_event.dart';

part 'city_search_state.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  final searchController = TextEditingController();
  final CitySearchInteractor _citySearchIteractor;
  final WeatherModelMapper _weatherModelMapper;

  CitySearchBloc(this._citySearchIteractor, this._weatherModelMapper)
      : super(const CitySearchState(isLoading: false)) {
    on<CitySearchDataFetched>(_onCitySearchDataFetched);
  }

  void _onCitySearchDataFetched(
    CitySearchDataFetched event,
    Emitter<CitySearchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final data = await _citySearchIteractor.fetchCurrentWeatherData(
        query: searchController.text);
    final model =
        data != null ? _weatherModelMapper.mapToWeatherData(data) : null;

    debugPrint(model.toString());

    emit(state.copyWith(model: model, isLoading: false));
  }
}
