import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  // MenusModel.fromJson(Map json) {
  //   name:
  //   json["name"];
  //   title:
  //   json["title"];
  //   route:
  //   json["route"];
  //   icon
  // }
}
