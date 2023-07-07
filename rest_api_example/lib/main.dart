import 'package:flutter/material.dart';
import 'package:rest_api_example/user/view/login_screen.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSceen(),
    );
  }
}
