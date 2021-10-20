import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/popular_item.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/view_model/restaurant_home_vm/restaurant_home_vm.dart';
import 'package:food_delivery/view_model/restaurant_home_vm/restaurant_home_vm_imp.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class BestDealsWidget extends StatelessWidget {
  BestDealsWidget({Key? key,required this.restaurant}) : super(key: key);
  final Restaurant restaurant;

  final RestaurantHomeViewModel _viewModel = RestaurantHomeViewModelImp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _viewModel.displayBestDealsByRestaurantId(
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
          var listBestDeals = snapshot.data as List<PopularItem>;
          return CarouselSlider(
            items: listBestDeals
                .map(
                  (e) => Builder(
                builder: (BuildContext context) => Container(
                  width: Get.width,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ImageFiltered(
                          imageFilter: ImageFilter.blur(
                              sigmaX: 5, sigmaY: 5),
                          child: CachedNetworkImage(
                            errorWidget:
                                (context, url, err) =>
                            const Center(
                              child: Icon(Icons.image),
                            ),
                            progressIndicatorBuilder:
                                (context, url,
                                downloadProgress) =>
                            const Center(
                              child:
                              CircularProgressIndicator(),
                            ),
                            imageUrl: e.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Text(
                            e.name,
                            style: GoogleFonts.jetBrainsMono(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration:
              const Duration(seconds: 3),
              autoPlayCurve: Curves.easeIn,
              height: double.infinity,
            ),
          );
        }
      },
    );
  }
}
