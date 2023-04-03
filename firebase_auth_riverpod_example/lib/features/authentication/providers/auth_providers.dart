import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/firebase_auth_methods.dart';

final authenticationProvider = Provider<FirebaseAuthMethods>((ref) {
  return FirebaseAuthMethods(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});

//  Creating a firebaseAuthProvider to get some basic details of the loggedIn user
//  though we can store it in database but for now we will just use it to get the user
final fireBaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
