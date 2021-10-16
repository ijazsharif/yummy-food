import 'package:json_annotation/json_annotation.dart';

part "restaurant.g.dart";

@JsonSerializable()
class Restaurant {
  String? restaurantId;
  final String address;
  final String name;
  final String imageUrl;
  final String paymentUrl;
  final String phone;

  Restaurant({
    this.restaurantId,
    required this.address,
    required this.name,
    required this.imageUrl,
    required this.paymentUrl,
    required this.phone,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
