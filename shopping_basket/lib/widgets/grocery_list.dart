import 'package:flutter/material.dart';
import 'package:shopping_basket/data/categories.dart';
import 'package:shopping_basket/widgets/new_item.dart';
import 'package:http/http.dart' as http;
import '../models/grocery_item_model.dart';
import 'dart:convert';

class GroceryList extends StatefulWidget {
  const GroceryList({
    super.key,
  });

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  /// final List can be increased/decreased. To prevent that use const.
  List<GroceryItem> _groceryItems = [];

  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  void _loadItem() async {
    final url = Uri.https('my-tiktok-flashcard-default-rtdb.firebaseio.com',
        'shopping-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere((catItem) => catItem.value.type == item.value['category'])
          .value;
      loadedItems.add(
        GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category),
      );
    }
    setState(() {
      _groceryItems = loadedItems;
    });
  }

  void _addItem() async {
    /// 'push' It can return value on pop and it's await
    /// Here we will practice how to add item in a new page and get the added item
    /// added item will be listed on the current screen.
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    /// Whenever you see a change in the list and apply those change use setState to update screen.
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    /// Show the content of the screen conditionlaly
    ///
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,

        /// OnDissmised we call _removeItem fnc to remove item from the list
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },

          // Each Listtile must have a value key so that it won't cause error on the element tree
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.typeColor,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

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
        body: content);
  }
}
