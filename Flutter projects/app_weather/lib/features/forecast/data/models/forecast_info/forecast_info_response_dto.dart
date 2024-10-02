import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'forecast_day_response_dto.dart';

part 'forecast_info_response_dto.g.dart';

@JsonSerializable()
class ForecastInfoResponseDto extends Equatable {

  @JsonKey(name: 'forecastday')
  final List<ForecastDayResponseDto> forecastDays;

  const ForecastInfoResponseDto({required this.forecastDays});

  factory ForecastInfoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastInfoResponseDtoFromJson(json);

  @override
  List<Object?> get props => [forecastDays];
}
