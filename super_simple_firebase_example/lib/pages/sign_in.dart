import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN IN'),
      ),
      body: const Center(
        child: ElevatedButton(
          onPressed: null,
          child: Text('Sign In'),
        ),
      ),
    );
  }
}
