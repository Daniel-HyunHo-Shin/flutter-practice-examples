import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/show_error_dialog.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //  This getter will be returning a Stream of User object.
  //  It will be used to check if the user is logged in or not.
  Stream<User?> get authStateChange => _auth.authStateChanges();

  // Now This Class Contains 3 Functions currently
  // 1. signInwithEmailAndPassword
  // 2. signInAnonymously
  // 3. signInWithGoogle
  // 4. signOut

  // 1. 이메일 로그인 기능 구현 클래스
  Future<void> signInwithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showErrorDialog(context, e);
    }
  }

  // 2. 익명 로그인 클래스 구현
  // UI에서는 'skip' 버튼으로 호출될 예정

  Future<void> signInAnonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      await showErrorDialog(context, e);
    }
  }
}
