import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_day_list_responce_dto.g.dart';

@JsonSerializable()
class ForecastDayResponseDto extends Equatable {
  @JsonKey(name: 'data', includeIfNull: false, required: false)
  final String? date;

  @JsonKey(name: 'data_epoch', includeIfNull: false, required: false)
  final int? dateEpoch;

  const ForecastDayResponseDto(this.date, this.dateEpoch);

  factory ForecastDayResponseDto.fromJson(Map<String, dynamic> json) => _$ForecastDayResponseDtoFromJson(json);

  @override
  List<Object?> get props => [date, dateEpoch];

}
