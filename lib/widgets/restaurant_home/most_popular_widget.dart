import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/popular_item.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/theme/strings.dart';
import 'package:food_delivery/view_model/restaurant_home_vm/restaurant_home_vm.dart';
import 'package:food_delivery/view_model/restaurant_home_vm/restaurant_home_vm_imp.dart';
import 'package:food_delivery/widgets/common/common_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MostPopularWidget extends StatelessWidget {
  MostPopularWidget({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;

  final RestaurantHomeViewModel _viewModel = RestaurantHomeViewModelImp();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                Expanded(
                  child: LiveList(
                    showItemDuration: const Duration(microseconds: 350),
                    showItemInterval: const Duration(microseconds: 150),
                    scrollDirection: Axis.horizontal,
                    itemCount: listPopular.length,
                    itemBuilder: animationItemBuilder(
                      (index) => Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                listPopular[index].image,
                              ),
                              minRadius: 40,
                              maxRadius: 60,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              listPopular[index].name,
                              style: GoogleFonts.jetBrainsMono(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
