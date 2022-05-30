import 'package:flutter/material.dart';
import 'package:laundry_app/screens/laundryapp.dart';
import 'package:laundry_app/screens/login/login_screen.dart';
import 'package:laundry_app/screens/register/register_screen.dart';

class Routes {
  Map<String, WidgetBuilder> getAllRoutes = {
    // '/': (_) => LaundryApp(),
    '/': (_) => LoginScreen(),
    '/register': (_) => RegisterScreen(),
    '/home': (_) => LaundryApp(),
  };
}
