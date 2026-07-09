import 'package:equatable/equatable.dart';

abstract class EditRestaurantProfileState extends Equatable {
  const EditRestaurantProfileState();

  @override
  List<Object> get props => [];
}

class EditRestaurantProfileInitial extends EditRestaurantProfileState {}

class EditRestaurantProfileLoading extends EditRestaurantProfileState {}

class EditRestaurantProfileSuccess extends EditRestaurantProfileState {
  final String? name;
  final String? description;
  final String? pucature;

  const EditRestaurantProfileSuccess({
    required this.name,
    required this.description,
    required this.pucature,
  });
}

class EditRestaurantProfileFailure extends EditRestaurantProfileState {
  final String error;

  const EditRestaurantProfileFailure(this.error);

  @override
  List<Object> get props => [error];
}
