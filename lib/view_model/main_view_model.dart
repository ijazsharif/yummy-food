import 'package:food_delivery/models/restaurant.dart';

abstract class MainViewModel {
  Future<List<Restaurant>> displayRestaurantList();
}
