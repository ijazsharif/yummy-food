import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery/theme/colors.dart';

class Menu extends StatelessWidget {
  const Menu({
    required this.zoomDrawerController,
    Key? key,
  }) : super(key: key);
  final ZoomDrawerController zoomDrawerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: menuBgColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                    ),
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
