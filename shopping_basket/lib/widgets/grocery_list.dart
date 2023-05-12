import 'package:flutter/material.dart';
import 'package:shopping_basket/widgets/new_item.dart';

import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({
    super.key,
  });

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => const NewItem(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => InkWell(
          onTap: () {},
          child: ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItems[index].category.typeColor,
            ),
            trailing: Text(
              groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
