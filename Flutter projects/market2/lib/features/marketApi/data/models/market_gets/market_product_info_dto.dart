import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_product_info_dto.g.dart';

@JsonSerializable()
class MarketCategoriesInfoDto extends Equatable {
  const MarketCategoriesInfoDto({required this.id, required this.name, required this.image});

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final List<String>? image;

  factory MarketCategoriesInfoDto.fromJson(Map<String, dynamic> json) =>
      _$MarketCategoriesInfoDtoFromJson(json);

  @override
  String toString() {
    return 'MarketCategories{ id: $id, name: $name, image: $image}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
