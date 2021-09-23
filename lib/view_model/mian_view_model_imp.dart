import 'package:food_delivery/firebase/restaurant_reference.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/view_model/main_view_model.dart';

class MainViewModelImp extends MainViewModel {
  @override
  Future<List<Restaurant>> displayRestaurantList() {
    return getRestaurantList();
  }
}
