import 'package:flutter/material.dart';
import 'package:recipe_tracker/screens/meals_screen.dart';

import '../data/dummy_data.dart';
import '../models/meal_model.dart';
import '../widgets/category_grid_item.dart';
import '../models/category_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;

  // Define a Navigator that has a button to move to other page
  void _selectedCategory(BuildContext context, Category category) {
    // Fliter the meals from the dummyData
    final filteredMealsList = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      // New Screen is defined with necessary arguments.
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: category.title,
            mealList: filteredMealsList,
            onToggleFavorite: onToggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // It's common to start with Scaffold for a new screen.
    // It's because they may not have a different appbar
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          // You can use map method from the list but it's also common to use for loop and I think it's moer readable
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectedCategory: () {
                _selectedCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
