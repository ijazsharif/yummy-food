import 'package:food_delivery/models/restaurant.dart';

abstract class HomeScreenViewModel {
  Future<List<Restaurant>> displayRestaurantList();
}
