import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

class FilteresSceen extends ConsumerWidget {
  const FilteresSceen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filteresProvider);

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
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filteresProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
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
            value: activeFilters[Filter.lactosFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filteresProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
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
    );
  }
}
