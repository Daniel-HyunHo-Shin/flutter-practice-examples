import 'package:amplify_trips/common/ui/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:amplify_trips/common/utils/colors.dart' as constants;

class TripsListPage extends StatelessWidget {
  const TripsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Amplify Trips Planner',
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(constants.primaryColorDark),
        child: const Icon(Icons.add),
      ),
      child: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
