import 'package:equatable/equatable.dart';

abstract class EditRestaurantProfileEvent extends Equatable {
  const EditRestaurantProfileEvent();

  @override
  List<Object> get props => [];
}

class EditRestaurantProfileRequested extends EditRestaurantProfileEvent {
  final String name;
  final String description;
  final String address;
  final String phoneNumber;

  const EditRestaurantProfileRequested({
    required this.name,
    required this.description,
    required this.address,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [name, description, address, phoneNumber];
}

class GetProfileInfo extends EditRestaurantProfileEvent {}
