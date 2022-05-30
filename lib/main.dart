import 'package:flutter/material.dart';
import 'package:laundry_app/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = Routes();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes.getAllRoutes,
      // initialRoute: '/login',
    );
  }
}
