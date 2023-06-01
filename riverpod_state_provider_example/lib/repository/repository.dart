import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';

final repositoryProvider = Provider((ref) => Repository(dataBase: Database()));

class Repository {
  final Database dataBase;

  List<Product> fetchProducts() {
    return Database.data;
  }

  Repository({
    required this.dataBase,
  });
}

class Database {
  static const data = [
    Product(name: 'Appple', price: 4),
    Product(name: 'Banana', price: 3),
    Product(name: 'Orange', price: 2),
    Product(name: 'Coffee', price: 1),
  ];
}
