import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/errors/failures.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/Domain/entities/restaurant_entity.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/data/datasource/edit_profile_impl.dart';

class EidtRestaurantProfileRepo {
  final EditProfileImpl _editProfileImpl;

  EidtRestaurantProfileRepo(this._editProfileImpl);
  Future<Either<Failure, RestaurantEntity>> getProfileInfo() async {
    try {
      final response = await _editProfileImpl.getProfile();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> edit() async {}
}
