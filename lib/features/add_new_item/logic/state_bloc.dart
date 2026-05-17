import 'package:equatable/equatable.dart';

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
