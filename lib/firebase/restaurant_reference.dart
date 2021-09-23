import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/utils/constants.dart';

Future<List<Restaurant>> getRestaurantList() async {
  var list = List<Restaurant>.empty(growable: true);
  var source =
      await FirebaseDatabase.instance.reference().child(restaurantRef).once();
  Map<dynamic, dynamic> values = source.value;
  values.forEach(
    (key, value) {
      list.add(
        Restaurant.fromJson(
          jsonDecode(jsonEncode(value)),
        ),
      );
    },
  );
  return list;
}
