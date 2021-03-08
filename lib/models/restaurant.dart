import 'dart:convert';

import 'menu.dart';

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menu,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menu menu;

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    pictureId = json["pictureId"];
    city = json["city"];
    rating = json["rating"].toDouble();
    menu = Menu.fromJson(json["menus"]);
  }
}

List<Restaurant> parseRestaurants(String json) {
  if (json == null) {
    return [];
  }
  final Map<String, dynamic> parsed = jsonDecode(json);
  return parsed["restaurants"]
      .map<Restaurant>((json) => Restaurant.fromJson(json))
      .toList();
}
