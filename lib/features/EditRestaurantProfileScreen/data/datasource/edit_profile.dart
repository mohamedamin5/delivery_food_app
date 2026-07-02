import 'package:flutter_application_2/features/EditRestaurantProfileScreen/data/model/restaurant_model.dart';

abstract class EditProfileDatasource {
  Future<void> editProfile({
    required String restaurantName,
    required String restaurantDescription,
    required String restaurantAddress,
    required String restaurantPhoneNumber,
    required String restaurantEmail,
    required String restaurantWebsite,
  });
  Future<RestaurantModel> getProfile();
}
