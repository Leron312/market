import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../../../core/network/constans.dart';
import '../../../search_city/data/models/current_weather_response_dto.dart';



class CitySearchApi {
  Future<CurrentWeatherResponseDto?> fetchCurrentWeatherData({required String query}) async {

    final url = Uri.parse('${NetworkConstants.baseUrl}/current.json?key=${NetworkConstants.apikey}&q=$query&aqi=no');

    debugPrint(url.toString());

    final response = await get(url);

    debugPrint('${response.statusCode}');

    if (response.statusCode == 200) {
      final map = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      debugPrint(map.toString());
      return CurrentWeatherResponseDto.fromJson(map);
    } else {
      return null;
    }
  }
}


