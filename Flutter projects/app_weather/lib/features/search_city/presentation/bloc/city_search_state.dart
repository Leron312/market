part of 'city_search_bloc.dart';

class CitySearchState extends Equatable {
  final WeatherModel? model;
  final bool isLoading;

  const CitySearchState({this.model, this.isLoading = true});

  CitySearchState copyWith({
    WeatherModel? model,
    bool? isLoading,
  }) {
    return CitySearchState(
      model: model ?? this.model,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        model,
        isLoading,
      ];
}
