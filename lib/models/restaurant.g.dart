// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      address: json['address'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      paymentUrl: json['paymentUrl'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'address': instance.address,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'paymentUrl': instance.paymentUrl,
      'phone': instance.phone,
    };
