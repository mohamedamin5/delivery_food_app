import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/errors/failures.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/Domain/entities/restaurant_entity.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/Domain/repositories/eidt_restaurant_profile_repo.dart';

class GetProfileInfoUseCase {
  final EidtRestaurantProfileRepo _eidtRestaurantProfileRepo;

  GetProfileInfoUseCase(this._eidtRestaurantProfileRepo);
  Future<Either<Failure, RestaurantEntity>> getProfileInfoUseCase() async {
    final response = await _eidtRestaurantProfileRepo.getProfileInfo();
    return response;
  }
}
