import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final void Function() onSelectedCategory;

  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectedCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12),
      onTap: onSelectedCategory,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: category.color,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Text(category.title),
        ),
      ),
    );
  }
}
