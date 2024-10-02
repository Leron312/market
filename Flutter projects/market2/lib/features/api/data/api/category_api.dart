import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../core/network/NetworkConstants.dart';
import '../../../marketApi/data/models/market_info/market_categories_dto.dart';

class CategoryApi {
  Future<List<MarketCategoriesDto>?> loadCategories() async {
    final uri = Uri.parse("${NetworkConstansts.baseUrl}products");
    final response = await http.get(uri);

    debugPrint('$response');
    if (response.statusCode == 200) {
      final list = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      debugPrint(list.toString());
      return list.map((e) => MarketCategoriesDto.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}