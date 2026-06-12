import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/features/add_new_item/logic/event_bloc.dart';
import 'package:flutter_application_2/features/add_new_item/logic/state_bloc.dart';
import 'package:flutter_application_2/features/add_new_item/data/repositories/repository.dart';

class AddNewItemBloc extends Bloc<AddNewItemEvent, AddNewItemState> {
  AddItemRepository repository;
  AddNewItemBloc(this.repository) : super(AddNewItemInitial()) {
    on<AddNewItemRequested>((event, emit) async {
      emit(AddNewItemLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        emit(AddNewItemSuccess());
      } catch (e) {
        emit(AddNewItemFailure(e.toString()));
      }
    });

    on<GetAllCategoriesRequested>((event, emit) async {
      emit(GetAllCategoriesLoading());
      try {
        final categories = await repository.getALlCategories();

        emit(GetAllCategoriesSuccess(categories));
      } catch (e) {
        emit(GetAllCategoriesFailure(e.toString()));
      }
    });
  }
}
