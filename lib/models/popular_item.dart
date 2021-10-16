import 'package:json_annotation/json_annotation.dart';

part "popular_item.g.dart";

@JsonSerializable()
class PopularItem {
  final String foodId;
  final String name;
  final String menuId;
  final String image;

  PopularItem({
    required this.foodId,
    required this.name,
    required this.menuId,
    required this.image,
  });

  factory PopularItem.fromJson(Map<String, dynamic> json) =>
      _$PopularItemFromJson(json);

  Map<String, dynamic> toJson() => _$PopularItemToJson(this);
}
