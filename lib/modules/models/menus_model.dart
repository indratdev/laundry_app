import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/config/routes/routes.dart';

class MenusModel {
  String name, title;
  String route;
  Icon iconn;

  MenusModel({
    required this.name,
    required this.title,
    required this.route,
    required this.iconn,
  });

  MenusModel getMainMenu() {
    return MenusModel(
        name: 'Transaksi',
        title: 'Transaksi',
        route: '/transaksi',
        iconn: Icon(Icons.menu));
  }
}
