import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/features/add_new_item/logic/event_bloc.dart';
import 'package:flutter_application_2/features/add_new_item/logic/state_bloc.dart';
import 'package:flutter_application_2/features/add_new_item/repositories/repository.dart';

class AddNewItemBloc extends Bloc<AddNewItemEvent, AddNewItemState> {
  AddItemRepository repository;
  AddNewItemBloc(this.repository) : super(AddNewItemInitial()) {
    on<AddNewItemRequested>((event, emit) async {
      emit(AddNewItemLoading());
      try {
        await repository.uploadFile(file: event.file);

        emit(AddNewItemSuccess());
      } catch (e) {
        emit(AddNewItemFailure(e.toString()));
      }
    });
  }
}
