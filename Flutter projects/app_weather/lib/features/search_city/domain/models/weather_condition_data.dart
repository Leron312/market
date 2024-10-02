import 'package:equatable/equatable.dart';

class WeatherConditionData extends Equatable{
  final int? code;
  final String? text;
  final String? icon;

  const WeatherConditionData(
      {required this.code, required this.text, required this.icon});

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
