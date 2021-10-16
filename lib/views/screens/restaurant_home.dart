import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:food_delivery/strings.dart';
import 'package:food_delivery/models/popular_item.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/view_model/restaurant_home_vm/restaurant_home_vm.dart';
import 'package:food_delivery/view_model/restaurant_home_vm/restaurant_home_vm_imp.dart';

class RestaurantHome extends StatelessWidget {
  RestaurantHome({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;

  final RestaurantHomeViewModel _viewModel = RestaurantHomeViewModelImp();

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
                child: SizedBox(
                  child: FutureBuilder(
                    future: _viewModel.displayMostPopularByRestaurantId(
                      restaurant.restaurantId!,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        var listPopular = snapshot.data as List<PopularItem>;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.mostPopularText,
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              listPopular.length.toString(),
                              style: GoogleFonts.jetBrainsMono(),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
