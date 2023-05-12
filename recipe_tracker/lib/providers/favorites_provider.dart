import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_tracker/providers/meals_provider.dart';

import '../models/meal_model.dart';
import 'filters_provider.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    /// Return a new State with following business logic:
    /// If the meal is in the list, it will remove that from the list
    /// Otherwise, new meal will be addede to that
    if (mealIsFavorite) {
      // Removing meal that
      // If newly addede meal is already in the list
      // return a new state that does not have that meal
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) {
    return FavoriteMealsNotifier();
  },
);

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filteresProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactosFree]! && !meal.isLactoseFree) {
      return false;
    }
    return true;
  }).toList();
});
