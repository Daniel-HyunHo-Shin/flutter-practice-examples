import 'package:flutter/material.dart';
import 'package:reddit_clone/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(Constants.logoPath),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Skip'),
          ),
        ],
      ),
    );
  }
}
