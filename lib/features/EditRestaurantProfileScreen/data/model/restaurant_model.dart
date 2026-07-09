import 'package:flutter_application_2/features/EditRestaurantProfileScreen/Domain/entities/restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  RestaurantModel({
    required super.restaurantName,
    required super.restaurantDescription,
    required super.restaurantPicture,
  });

  factory RestaurantModel.fromJson(Map<String, String> json) {
    return RestaurantModel(
      restaurantDescription: json['restaurant_description'] ?? '',
      restaurantName: json['restaurant_name'] ?? '',
      restaurantPicture: json['restaurant_picture'] ?? '',
    );
  }
}
