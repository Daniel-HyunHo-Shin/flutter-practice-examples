import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/firebase_auth_methods.dart';

final authenticationProvider = Provider<FirebaseAuthMethods>((ref) {
  return FirebaseAuthMethods(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});
