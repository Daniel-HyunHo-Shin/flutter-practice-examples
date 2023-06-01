import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_provider_example/repository/repository.dart';

import '../models/product.dart';
import '../models/product_sort_type.dart';

final controllerProvider = Provider((ref) {
  final repository = ref.watch(repositoryProvider);
  final productSortType = ref.watch(productSortTypeProvider);

  return Controller(
    ref: ref,
    repository: repository,
    productSortType: productSortType,
  );
});

final productSortTypeProvider = StateProvider((ref) => ProductSortType.name);

class Controller {
  final ProviderRef ref;
  final Repository repository;
  final ProductSortType productSortType;

  Controller({
    required this.ref,
    required this.repository,
    required this.productSortType,
  });

  void updateSortType(ProductSortType newValue) {
    final notifier = ref.read(productSortTypeProvider.notifier);
    notifier.state = newValue;
  }

  ProductSortType getSortType() {
    return ref.watch(productSortTypeProvider);
  }

  List<Product> getFilteredList() {
    final sortType = ref.watch(productSortTypeProvider);
    final products = ref.watch(repositoryProvider).fetchProducts();
    switch (sortType) {
      case ProductSortType.name:
        products.sort(
          (a, b) => a.name.compareTo(b.name),
        );
        return products;
      case ProductSortType.price:
        products.sort(
          ((a, b) => a.price.compareTo(b.price)),
        );
        return products;
    }
  }
}
