import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_categories_dto.g.dart';

@JsonSerializable()
class MarketCategoriesDto extends Equatable {
  const MarketCategoriesDto({required this.id, required this.name, required this.image});

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final String? image;

  factory MarketCategoriesDto.fromJson(Map<String, dynamic> json) =>
      _$MarketCategoriesDtoFromJson(json);

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
