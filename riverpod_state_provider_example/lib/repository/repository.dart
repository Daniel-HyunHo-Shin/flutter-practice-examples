import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';

final repositoryProvider = Provider((ref) => Repository(mockData: _products));

class Repository {
  final List<Product> mockData;
  Repository({
    required this.mockData,
  });
}

final _products = [
  const Product(name: 'Appple', price: 4),
  const Product(name: 'Banana', price: 3),
  const Product(name: 'Orange', price: 2),
  const Product(name: 'Coffee', price: 1),
];
