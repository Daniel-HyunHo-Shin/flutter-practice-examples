import 'package:flutter/material.dart';

// If Firebase initialization takes some time, LoadingScreen will be displayed until the process completes
class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
