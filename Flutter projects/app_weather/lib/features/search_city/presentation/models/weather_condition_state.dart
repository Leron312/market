enum WeatherConditionState{
  sanny(code: 1000),
  partlyCloude(code: 1003),
  cloudy (code: 1006),
  overcast (code: 1009),
  drizzle (code: 1030),
  lightRain (code: 1183),
  heavyRain (code: 1195),
  lightsnow (code: 1213),
  heavysnow (code: 1225),
  unknow(code: 0),
  ;

  const WeatherConditionState({required this.code});

  final int code;
}