import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantInfoWidget extends StatelessWidget {
  const RestaurantInfoWidget({
    Key? key,
    required this.name,
    required this.address,
  }) : super(key: key);

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              name,
              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              address,
              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
