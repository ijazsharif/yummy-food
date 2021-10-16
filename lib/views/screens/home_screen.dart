import 'package:auto_animated/auto_animated.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/widgets/restaurant_image.dart';
import 'package:food_delivery/widgets/restaurant_info.dart';
import 'package:food_delivery/views/screens/restaurant_home.dart';
import 'package:food_delivery/widgets/common/common_widgets.dart';
import 'package:food_delivery/view_model/home_screen_vm/home_screen_view_model_imp.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;
  final viewModel = HomeScreenViewModelImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurant",
          style: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.w900),
        ),
      ),
      body: FutureBuilder(
        future: viewModel.displayRestaurantList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var list = snapshot.data as List<Restaurant>;
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: LiveList(
                showItemDuration: const Duration(microseconds: 350),
                showItemInterval: const Duration(microseconds: 150),
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: animationItemBuilder(
                  (index) => InkWell(
                    onTap: () {
                      Get.to(
                        () => RestaurantHome(
                          restaurant: list[index],
                        ),
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: Get.height / 2.5 * 1.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RestaurantImageWidget(imageUrl: list[index].imageUrl),
                          RestaurantInfoWidget(
                            name: list[index].name,
                            address: list[index].address,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
