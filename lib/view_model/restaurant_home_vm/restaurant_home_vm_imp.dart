import 'package:food_delivery/firebase/popular_reference.dart';
import 'package:food_delivery/models/popular_item.dart';
import 'package:food_delivery/view_model/restaurant_home_vm/restaurant_home_vm.dart';

class RestaurantHomeViewModelImp extends RestaurantHomeViewModel {
  @override
  Future<List<PopularItem>> displayMostPopularByRestaurantId(
      String restaurantId) {
    return getMostPopularByRestaurantId(restaurantId);
  }
}
