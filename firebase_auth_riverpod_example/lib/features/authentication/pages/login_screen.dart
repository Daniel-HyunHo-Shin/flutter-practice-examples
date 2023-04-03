import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Email address',
                  hintStyle: const TextStyle(color: Colors.black54),
                  icon: Icon(Icons.email_outlined,
                      color: Colors.blue.shade700, size: 24),
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.black54),
                  icon: Icon(Icons.lock, color: Colors.blue.shade700, size: 24),
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
