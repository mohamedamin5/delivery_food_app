import 'package:flutter_application_2/features/EditRestaurantProfileScreen/Domain/entities/restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  RestaurantModel({
    required super.restaurantName,
    required super.restaurantDescription,
    required super.restaurantPicture,
  });

  factory RestaurantModel.fromJson(Map<String, String> json) {
    return RestaurantModel(
      restaurantDescription: json['restaurant_name'] as String,
      restaurantName: json['restaurant_description'] as String,
      restaurantPicture: json['restaurant_picture'] as String,
    );
  }
}
