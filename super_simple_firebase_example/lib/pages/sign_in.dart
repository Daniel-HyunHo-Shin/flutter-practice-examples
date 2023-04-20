import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  Future<void> _signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN IN'),
      ),
      body: Center(
        child: ElevatedButton(
          // _signInAnonymously에는 ()를 붙이지 않는다.
          // 붙일 경우 build()가 호출될 때마다 _signInAnonymously가 호출되기 때문이다.
          onPressed: _signInAnonymously,
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}
