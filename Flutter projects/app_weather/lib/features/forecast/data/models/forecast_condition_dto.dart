import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_condition_dto.g.dart';

@JsonSerializable()
class ForecastConditionDto extends Equatable {
  const ForecastConditionDto(
      {required this.text, required this.icon, required this.code});

  @JsonKey(name: 'code', required: false, includeIfNull: false)
  final int? code;

  @JsonKey(name: 'text', required: false, includeIfNull: false)
  final String? text;

  @JsonKey(name: 'icon', required: false, includeIfNull: false)
  final String? icon;

  factory ForecastConditionDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastConditionDtoFromJson(json);

  @override
  String toString() {
    return 'WeatherConditionData{code: $code, text: $text, icon: $icon}';
  }

  @override
  List<Object?> get props => [
        code,
        text,
        icon,
      ];
}
