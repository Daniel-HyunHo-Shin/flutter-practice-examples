import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal_model.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // Removing meal that
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final _favoriteMealsProvider = StateNotifierProvider(
  (ref) {},
);
