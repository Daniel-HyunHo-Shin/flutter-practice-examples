import 'package:flutter/material.dart';
import 'package:recipe_tracker/data/dummy_data.dart';
import 'package:recipe_tracker/screens/categories_screen.dart';
import 'package:recipe_tracker/screens/fliters_screen.dart';
import 'package:recipe_tracker/screens/meals_screen.dart';
import 'package:recipe_tracker/widgets/main_drawer.dart';

import '../models/meal_model.dart';

// Naming global varable: starts with k
const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // Index to manage BottomAppNavigation
  int _selectedPageIndex = 0;

  // Lifted State: List of faviroteMeals will be mangaged here
  final List<Meal> _favoriteMeals = [];

  //
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  // Adding FavoriteStatus is addede to the Lifted State.
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisitng = _favoriteMeals.contains(meal);
    if (isExisitng) {
      _showInfoMessage('Meal is no longer Favorite');
      setState(() {
        _favoriteMeals.remove(meal);
      });
    } else {
      _showInfoMessage('Meal is added to Favorite');
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500),
        content: Text(message),
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'Filters') {
      var result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilteresSceen(currentFilters: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
        onToggleFavorite: _toggleMealFavoriteStatus,
        availableMeals: availableMeals);

    String activeScreenTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        mealList: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activeScreenTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),

      // Drawer
      drawer: MainDrawer(onSelectScreen: _setScreen),

      // Active Screen can be: 1. MealsScreen or Categories Screen
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
