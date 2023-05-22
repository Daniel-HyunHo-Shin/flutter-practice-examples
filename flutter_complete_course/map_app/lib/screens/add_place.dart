import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_app/providers.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  ///
  void _savePlace() {
    /// 1. 저장 대상 지정
    /// 2. validation
    /// 3. update state
    /// 4. navigatior pop

    // 1.
    final enteredText = _titleController.text;

    // 2.
    if (enteredText.isEmpty) {
      return;
    }

    // 3.
    ref.read(userPlacesProvider.notifier).addPlace(enteredText);

    // 4.
    Navigator.of(context).pop();
  }

  var favoritePlaces = [];

  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new item'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add place'),
              onPressed: _savePlace,
            )
          ],
        ),
      ),
    );
  }
}
