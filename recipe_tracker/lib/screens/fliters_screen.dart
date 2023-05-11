import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactosFree,
}

class FilteresSceen extends StatefulWidget {
  const FilteresSceen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FilteresSceen> createState() => _FilteresSceenState();
}

class _FilteresSceenState extends State<FilteresSceen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactosFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),

      // drawer: MainDrawer(
      //   onSelectScreen: ((identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'Meals') {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabScreen(),
      //         ),
      //       );
      //     }
      //   }),
      // ),
      body: WillPopScope(
        onWillPop: () async {
          // Pop method return the value to the Navigator.push that routes our app to this page
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactosFree: _lactoseFreeFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: const Text(
                'Gluten-free',
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            //
            //
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: const Text(
                'Lactose-free',
              ),
              subtitle: Text(
                'Only include Lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
