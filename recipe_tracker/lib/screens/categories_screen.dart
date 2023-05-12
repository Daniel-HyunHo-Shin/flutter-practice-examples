import 'package:flutter/material.dart';
import 'package:recipe_tracker/screens/meals_screen.dart';

import '../data/dummy_data.dart';
import '../models/meal_model.dart';
import '../widgets/category_grid_item.dart';
import '../models/category_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  // Define a Navigator that has a button to move to other page
  void _selectedCategory(BuildContext context, Category category) {
    // Fliter the meals from the dummyData
    final filteredMealsList = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      // New Screen is defined with necessary arguments.
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          mealList: filteredMealsList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // It's common to start with Scaffold for a new screen.
    // It's because they may not have a different appbar
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut)),
        child: child,
      ),
    );
  }
}
