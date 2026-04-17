import 'package:flutter_application_2/blocs_imports.dart';
import 'package:flutter_application_2/features/Home/listrest.dart';
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

    on<LoadInitialData>((event, emit) async {
      emit(HomeLoading());

      try {
        // Simulate initial data loading
        await Future.delayed(const Duration(seconds: 2));

        final filteredItems = getFilteredItems(
          "All",
        ); // Load all items initially

        emit(
          HomeSuccess(
            filteredItems: filteredItems,
            categories: categories,
            restaurantlist: restaurantlist,
          ),
        );
      } catch (error) {
        emit(HomeError('Failed to load initial data: $error'));
      }
    });

    on<SelectCategory>((event, emit) async {
      emit(HomeLoading());

      try {
        // Simulate API call or heavy computation
        await Future.delayed(const Duration(seconds: 3));

        final filteredItems = getFilteredItems(event.category);

        emit(
          HomeSuccess(
            filteredItems: filteredItems,
            categories: categories,
            restaurantlist: restaurantlist,
          ),
        );
      } catch (error) {
        emit(HomeError('Failed to load data: $error'));
      }
    });

    // Automatically load initial data when bloc is created
    add(LoadInitialData());
  }
}
