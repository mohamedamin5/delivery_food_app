import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/core/network/api_endpoints.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source_impl.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/data/datasource/edit_profile.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/data/model/restaurant_model.dart';

class EditProfileImpl implements EditProfileDatasource {
  final IApiConsumer apiConsumer;
  final AuthLocalDataSourceImpl authLocalDataSourceImpl;
  EditProfileImpl(this.apiConsumer, this.authLocalDataSourceImpl);
  @override
  Future<void> editProfile({
    required String restaurantName,
    required String restaurantDescription,
    required String restaurantAddress,
    required String restaurantPhoneNumber,
    required String restaurantEmail,
    required String restaurantWebsite,
  }) async {
    try {
      String? token = await authLocalDataSourceImpl.getAuthData(
        StorageKeys.accessToken,
      );
      await apiConsumer.post(
        'url',
        headers: {"Authorization": "Bearer $token"},
      );
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<RestaurantModel> getProfile() async {
    try {
      String? token = await authLocalDataSourceImpl.getAuthData(
        StorageKeys.accessToken,
      );
      final response = await apiConsumer.get(
        ApiEndpoints.profileChef,
        headers: {"Authorization": "Bearer $token"},
      );
      return RestaurantModel.fromJson(response);
    } catch (e) {
      throw e.toString();
    }
  }
}
