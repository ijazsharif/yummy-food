import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/restaurant_home/best_deals_widget.dart';
import 'package:food_delivery/widgets/restaurant_home/most_popular_widget.dart';
import 'package:food_delivery/models/restaurant.dart';

class RestaurantHome extends StatelessWidget {
  const RestaurantHome({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(restaurant.name),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: MostPopularWidget(restaurant: restaurant),
              ),
              Expanded(
                flex: 2,
                child: BestDealsWidget(restaurant: restaurant,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


