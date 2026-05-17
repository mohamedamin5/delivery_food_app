import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/features/add_new_item/logic/event_bloc.dart';
import 'package:flutter_application_2/features/add_new_item/logic/state_bloc.dart';

class AddNewItemBloc extends Bloc<AddNewItemEvent, AddNewItemState> {
  AddNewItemBloc() : super(AddNewItemInitial()) {
    on<AddNewItemRequested>((event, emit) async {
      emit(AddNewItemLoading());
      try {
        // Simulate a network call or database operation
        await Future.delayed(const Duration(seconds: 2));
        emit(AddNewItemSuccess());
      } catch (e) {
        emit(AddNewItemFailure(e.toString()));
      }
    });
  }
}
