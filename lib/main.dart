import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/theme/colors.dart';
import 'package:food_delivery/views/screens/home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp(app: app));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yummy Food',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
        ),
        primaryColor: primaryColor,
      ),
      home: HomeScreen(app: app),
    );
  }
}
