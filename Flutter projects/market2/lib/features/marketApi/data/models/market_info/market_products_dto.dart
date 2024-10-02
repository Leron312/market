import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:market2/features/marketApi/data/models/market_info/market_categories_dto.dart';

part 'market_products_dto.g.dart';

@JsonSerializable()
class MarketProductsDto extends Equatable {
  const MarketProductsDto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  @JsonKey(name: 'id', includeIfNull: false, required: false)
  final int? id;

  @JsonKey(name: 'title', includeIfNull: false, required: false)
  final String? title;

  @JsonKey(name: 'price', includeIfNull: false, required: false)
  final int? price;

  @JsonKey(name: 'description', includeIfNull: false, required: false)
  final String? description;

  @JsonKey(name: 'category', includeIfNull: false, required: false)
  final MarketCategoriesDto? category;

  @JsonKey(name: 'images', includeIfNull: false, required: false)
  final List<dynamic>? images;

  factory MarketProductsDto.fromJson(Map<String, dynamic> json) =>
      _$MarketProductsDtoFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        images,
      ];
}
