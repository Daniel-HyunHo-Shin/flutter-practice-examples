// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import app-specific code
import 'firebase_options.dart';
import 'router/router.dart';

// The main function that starts the app
void main(List<String> args) async {
  // Make sure Flutter is initialized before using any plugins or packages
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase with the default options for the current platform
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Use Riverpod to create the app's main widget tree and provide state
  runApp(const ProviderScope(child: MainApp()));
}

// The main app widget
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a MaterialApp that uses Riverpod's router for navigation
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // Customize the app's theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
      ),
      // Use the app's GoRouter instance to manage navigation
      routerConfig: goRouter,
    );
  }
}
