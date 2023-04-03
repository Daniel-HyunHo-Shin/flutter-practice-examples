import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/show_error_dialog.dart';

// This class contains methods that 'implement' various Firebase authentication features
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

  // This method signs in a user with email and password credentials
  Future<void> signInwithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showErrorDialog(context, e);
    }
  }

  // This method signs in an anonymous user
  // It will be triggered by a 'skip' button on the UI
  Future<void> signInAnonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      await showErrorDialog(context, e);
    }
  }

  // This method signs in a user with Google credentials
  // It is not yet implemented in this code sample
  Future<void> signInWithGoogle() async {
    // TODO: Implement sign in with Google
  }

  // This method signs the user out of the app
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
