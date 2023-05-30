import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_provider_example/controller/controller.dart';

import '../models/product_sort_type.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(controllerProvider);
    final products = controller.getFilteredList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
              value: controller.getSortType(),
              items: const [
                DropdownMenuItem(
                  value: ProductSortType.name,
                  child: Icon(Icons.sort_by_alpha),
                ),
                DropdownMenuItem(
                  value: ProductSortType.price,
                  child: Icon(Icons.sort),
                ),
              ],
              onChanged: (newValue) {
                controller.updateSortType(newValue!);
              }),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.price.toString()),
          );
        },
      ),
    );
  }
}
