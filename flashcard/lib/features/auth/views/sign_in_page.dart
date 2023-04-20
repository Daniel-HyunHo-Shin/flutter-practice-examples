// sign_in_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign in with Google'),
          onPressed: () async {
            // Implement signInWithGoogle function (shown below)
            final user = await signInWithGoogle(auth);
            if (user != null) {
              // Navigate to the main page
            } else {
              // Show an error message
            }
          },
        ),
      ),
    );
  }
}

Future<User?> signInWithGoogle(FirebaseAuth auth) async {
  return null;

  // Implement the Google sign-in flow
}
