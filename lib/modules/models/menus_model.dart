import 'package:flutter/cupertino.dart';
import 'package:laundry_app/config/routes/routes.dart';

class MenusModel {
  String name, title;
  Routes route;
  IconData icon;

  MenusModel({
    required this.name,
    required this.title,
    required this.route,
    required this.icon,
  });
}
