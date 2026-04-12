import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/models/menu_item.dart';
import 'package:flutter_application_2/models/resttaurant.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  final List<String> categories;
  final List<MenuItem> filteredItems;
  final List<Restaurant> restaurantlist;
  const HomeSuccess({
    required this.filteredItems,
    required this.categories,
    required this.restaurantlist,
  });
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
