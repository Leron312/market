import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:market2/core/network/NetworkConstants.dart';
import 'package:market2/features/marketApi/data/models/market_info/market_products_dto.dart';

class HomeApi {
  Future<List<MarketProductsDto>?> loadProducts() async {
    final uri = Uri.parse("${NetworkConstansts.baseUrl}products");
    final response = await http.get(uri);

    debugPrint('$response');
    if (response.statusCode == 200) {
      final list = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      debugPrint(list.toString());
      return list.map((e) => MarketProductsDto.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}

