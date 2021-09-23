import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/view_model/mian_view_model_imp.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;
  final viewModel = MainViewModelImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
      ),
      body: FutureBuilder(
        future: viewModel.displayRestaurantList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var list = snapshot.data as List<Restaurant>;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Text(list[index].name);
              },
            );
          }
        },
      ),
    );
  }
}
