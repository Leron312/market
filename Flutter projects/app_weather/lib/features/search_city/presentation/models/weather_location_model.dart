import 'package:equatable/equatable.dart';

class WeatherLocationModel extends Equatable{
  const WeatherLocationModel(
      {required this.name,
        required this.region,
        required this.country,
        required this.localtime});

  final String name;
  final String region;
  final String country;
  final String localtime;

  @override
  List<Object?> get props => [
    name,
    region,
    country,
    localtime,
  ];
}
