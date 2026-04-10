import 'package:flutter_application_2/models/menu_item.dart';

class Restaurant {
  final String name;
  final Map<String, List<MenuItem>> categorie;
  final double rating;
  final String delivery;
  final String time;
  Restaurant({
    required this.name,
    required this.categorie,
    required this.rating,
    required this.delivery,
    required this.time,
  });

  factory Restaurant.fromjson(Map<String, dynamic> list) {
    return Restaurant(
      name: list["name"] ?? '',
      categorie: (list["categories"] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          (value as List).map((e) => MenuItem.fromJson(e)).toList(),
        ),
      ),
      rating: list["rating"],
      delivery: list["delivery"],
      time: list["time"],
    );
  }
}
