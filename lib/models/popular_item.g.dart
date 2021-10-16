// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularItem _$PopularItemFromJson(Map<String, dynamic> json) => PopularItem(
      foodId: json['food_id'] as String,
      name: json['name'] as String,
      menuId: json['menu_id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$PopularItemToJson(PopularItem instance) =>
    <String, dynamic>{
      'food_id': instance.foodId,
      'name': instance.name,
      'menu_id': instance.menuId,
      'image': instance.image,
    };
