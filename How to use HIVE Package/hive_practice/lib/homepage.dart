import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');

  void writeData() {
    _myBox.put(1, 'Mitch');
    print(
      ' Write: ${_myBox.get(1)}',
    );
  }

  void readData() {
    print(
      _myBox.get(1),
    );
  }

  void deleteData() {
    _myBox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                writeData();
              },
              child: const Text('Write'),
            ),
            ElevatedButton(
              onPressed: () {
                readData();
              },
              child: const Text('Read'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteData();
              },
              child: const Text('Delete '),
            ),
          ],
        ),
      ),
    );
  }
}
