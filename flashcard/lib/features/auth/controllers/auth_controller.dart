import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class AuthController extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _userModel = UserModel(userCredential.user);
      notifyListeners();
    } on FirebaseAuthException {
      // Handle login errors
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    _userModel = null;
    notifyListeners();
  }

  void checkUserLoginStatus() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        _userModel = null;
      } else {
        _userModel = UserModel(user);
      }
      notifyListeners();
    });
  }
}
