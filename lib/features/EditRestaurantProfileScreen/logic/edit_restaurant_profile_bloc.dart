import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/logic/edit_restaurant_profile_event.dart';
import 'package:flutter_application_2/features/EditRestaurantProfileScreen/logic/edit_restaurant_profile_state.dart';

class EditRestaurantProfileBloc
    extends Bloc<EditRestaurantProfileEvent, EditRestaurantProfileState> {
  EditRestaurantProfileBloc() : super(EditRestaurantProfileInitial());
}
