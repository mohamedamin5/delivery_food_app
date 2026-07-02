import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/features/add_new_item/Domian/usecases/add_item_use_case.dart';
import 'package:flutter_application_2/features/add_new_item/Domian/usecases/get_all_categories_use_case.dart';
import 'package:flutter_application_2/features/add_new_item/logic/event_bloc.dart';
import 'package:flutter_application_2/features/add_new_item/logic/state_bloc.dart';

class AddNewItemBloc extends Bloc<AddNewItemEvent, AddNewItemState> {
  final AddItemUseCase addItemUseCase;
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  AddNewItemBloc(this.addItemUseCase, this.getAllCategoriesUseCase)
    : super(AddNewItemInitial()) {
    on<AddNewItemRequested>((event, emit) async {
      emit(AddNewItemLoading());
      try {
        await addItemUseCase.addItemToDatabase(
          event.name,
          event.description,
          event.price,
          event.categoryId,
          event.file,
        );
        emit(AddNewItemSuccess());
      } catch (e) {
        emit(AddNewItemFailure(e.toString()));
      }
    });

    on<GetAllCategoriesRequested>((event, emit) async {
      emit(GetAllCategoriesLoading());

      final categories = await getAllCategoriesUseCase.execute();
      categories.fold(
        (failure) => emit(GetAllCategoriesFailure(failure)),
        (categories) => emit(GetAllCategoriesSuccess(categories)),
      );
    });
  }
}
