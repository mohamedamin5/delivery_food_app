import 'package:flutter_application_2/features/EditRestaurantProfileScreen/Domain/cases/get_profile_info_use_case.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/logic/edit_restaurant_profile_event.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/logic/edit_restaurant_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRestaurantProfileBloc
    extends Bloc<EditRestaurantProfileEvent, EditRestaurantProfileState> {
  final GetProfileInfoUseCase _getProfileInfoUseCase;

  EditRestaurantProfileBloc(this._getProfileInfoUseCase)
    : super(EditRestaurantProfileInitial()) {
    on<GetProfileInfo>((event, emit) async {
      emit(EditRestaurantProfileLoading());

      final response = await _getProfileInfoUseCase.getProfileInfoUseCase();

      response.fold(
        (l) => emit(EditRestaurantProfileFailure(l.message)),
        (r) => EditRestaurantProfileSuccess(
          name: r.restaurantName,
          description: r.restaurantDescription,
          pucature: r.restaurantPicture,
        ),
      );
    });
  }
}
