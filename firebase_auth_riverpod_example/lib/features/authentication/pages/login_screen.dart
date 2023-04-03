import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authenticationProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                auth.signInAnonymously(context);
              },
              child: const Text('Skip'))
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Dive into anything',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Image.asset(
                'assets/images/flag-dynamic-color.png',
                height: 400,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    auth.signInWithGoogle(context);
                  },
                  icon: Image.asset(
                    'assets/images/google.png',
                    width: 35,
                  ),
                  label: const Text(
                    'Continue with Google',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
