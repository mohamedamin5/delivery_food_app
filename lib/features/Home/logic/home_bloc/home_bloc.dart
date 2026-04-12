import 'package:flutter_application_2/blocs_imports.dart';
import 'package:flutter_application_2/features/Home/listrest.dart';
import 'package:flutter_application_2/features/Home/logic/home_bloc/home_event.dart';
import 'package:flutter_application_2/features/Home/logic/home_bloc/home_state.dart';
import 'package:flutter_application_2/models/menu_item.dart';
import 'package:flutter_application_2/models/resttaurant.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeLoading()) {
    final List<Restaurant> restaurantList = restaurants
        .map((e) => Restaurant.fromjson(e))
        .toList();
    List<MenuItem> getFilteredItems(String selectedCategory) {
      if (selectedCategory == "All") {
        return restaurantList
            .expand((r) => r.categorie.values)
            .expand((list) => list)
            .toList();
      }

      if (selectedCategory == "Other") {
        return restaurantList
            .expand((r) => r.categorie.entries)
            .where((entry) => !categories.contains(entry.key))
            .expand((entry) => entry.value)
            .toList();
      }

      return restaurantList
          .expand((r) => r.categorie.entries)
          .where((entry) => entry.key == selectedCategory)
          .expand((entry) => entry.value)
          .toList();
    }

    List<Restaurant> restaurantlist = restaurants
        .map((e) => Restaurant.fromjson(e))
        .toList();

    on<SelectCategory>((event, emit) {
      emit(HomeLoading());
      Future.delayed(const Duration(seconds: 3), () {
        emit(
          HomeSuccess(
            filteredItems: getFilteredItems(event.category),
            categories: categories,
            restaurantlist: restaurantlist,
          ),
        );
      });
    });
  }
}
