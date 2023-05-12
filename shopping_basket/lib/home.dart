import 'package:flutter/material.dart';

import 'data/dummy_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          for (final grocery in groceryItems)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListTile(
                key: ValueKey(grocery.id),
                title: Text(grocery.name),
                leading: Container(
                  width: 40,
                  height: 40,
                  color: grocery.category.typeColor,
                ),
                trailing: Text(grocery.quantity.toString()),
              ),
            ),
        ],
      ),
    );
  }
}
