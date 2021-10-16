import 'package:food_delivery/models/popular_item.dart';

abstract class RestaurantHomeViewModel {
  Future<List<PopularItem>> displayMostPopularByRestaurantId(
      String restaurantId);
}
