import 'package:equatable/equatable.dart';

class WeatherConditionResponseDto extends Equatable{
  final int? code;
  final String? text;
  final String? icon;

  const WeatherConditionResponseDto (
      {required this.code, required this.text, required this.icon});

  factory WeatherConditionResponseDto.fromJson(Map<String, dynamic> json) {
    return WeatherConditionResponseDto(
      code: json['code'],
      text: json['text'],
      icon: json['icon'],
    );
  }

  @override
  String toString() {
    return 'WeatherConditionResponseDto{code: $code, text: $text, icon: $icon}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    code,
    text,
    icon,
  ];
}
