import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/features/add_new_item/data/model/add_item_response_model.dart';

abstract class AddNewItemState extends Equatable {
  const AddNewItemState();

  @override
  List<Object> get props => [];
}

class AddNewItemInitial extends AddNewItemState {}

class AddNewItemLoading extends AddNewItemState {}

class AddNewItemSuccess extends AddNewItemState {}

class AddNewItemFailure extends AddNewItemState {
  final String error;

  const AddNewItemFailure(this.error);

  @override
  List<Object> get props => [error];
}

class GetAllCategoriesLoading extends AddNewItemState {}

class GetAllCategoriesSuccess extends AddNewItemState {
  final List<String> categories;
  const GetAllCategoriesSuccess(this.categories);
}

class GetAllCategoriesFailure extends AddNewItemState {
  final String error;

  const GetAllCategoriesFailure(this.error);

  @override
  List<Object> get props => [error];
}


// AddItemResponseModel