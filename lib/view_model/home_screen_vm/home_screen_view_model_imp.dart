import 'package:food_delivery/firebase/restaurant_reference.dart';
import 'package:food_delivery/models/restaurant.dart';

import 'home_screen_view_model.dart';

class HomeScreenViewModelImp extends HomeScreenViewModel {
  @override
  Future<List<Restaurant>> displayRestaurantList() {
    return getRestaurantList();
  }
}
