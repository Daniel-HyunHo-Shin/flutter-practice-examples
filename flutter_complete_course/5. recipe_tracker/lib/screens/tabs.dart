import 'package:flutter/material.dart';
import 'package:recipe_tracker/providers/favorites_provider.dart';
import 'package:recipe_tracker/screens/categories_screen.dart';
import 'package:recipe_tracker/screens/fliters_screen.dart';
import 'package:recipe_tracker/screens/meals_screen.dart';
import 'package:recipe_tracker/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

// Naming global varable: starts with k
const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  // Index to manage BottomAppNavigation
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilteresSceen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activeScreen = CategoriesScreen(availableMeals: availableMeals);

    String activeScreenTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activeScreen = MealsScreen(
        mealList: favoriteMeals,
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
