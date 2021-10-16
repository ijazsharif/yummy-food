import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:food_delivery/models/popular_item.dart';
import 'package:food_delivery/utils/constants.dart';

Future<List<PopularItem>> getMostPopularByRestaurantId(
    String restaurantId) async {
  var list = List<PopularItem>.empty(growable: true);
  var source = await FirebaseDatabase.instance
      .reference()
      .child(restaurantRef)
      .child(restaurantId)
      .child(mostPopularRef)
      .once();
  Map<dynamic, dynamic> values = source.value;

  values.forEach(
    (key, value) {
      list.add(
        PopularItem.fromJson(
          jsonDecode(jsonEncode(value)),
        ),
      );
    },
  );
  return list;
}
