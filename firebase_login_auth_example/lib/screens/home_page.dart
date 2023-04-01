import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 플러터 Login시 보여지는 최초 화면 UI
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Skip 버튼을 만들기. Skip 버튼 누를시 익명 아이디로 운영
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            child: const Text('Skip'),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/EmailSignUpPage'),
              child: const Text('Email Sign Up'),
            ),
            ElevatedButton(
                onPressed: () => context.go('/EmailLogInPage'),
                child: const Text('Email LogIn'))
          ],
        ),
      ),
    );
  }
}
