import 'package:flutter/material.dart';
import 'package:recipe_tracker/screens/meal_details_screen.dart';
import 'package:recipe_tracker/widgets/meal_item.dart';

import '../models/meal_model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.mealList,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> mealList;
  final void Function(Meal meal) onToggleFavorite;

  // Define a navigaition fuction on the screen that has a button.
  void _selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Content if Data does not exisit
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No Data',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );

    // If mealList is notEmpty, return Content from the data
    if (mealList.isNotEmpty) {
      content = ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: mealList[index],
          onSelectMeal: (meal) {
            _selectedMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    // Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
