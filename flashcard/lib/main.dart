// Import necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/auth/controllers/auth_controller.dart';
import 'features/auth/views/erroer_screen.dart';
import 'features/auth/views/loader.dart';
import 'firebase_options.dart';
import 'router/router.dart';

final authControllerProvider =
    ChangeNotifierProvider((ref) => AuthController());

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
});

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use a FutureProvider called firebaseinitializerProvider to initialize Firebase
    // This allows the initialization process to be properly managed and the state of the process to be tracked and responded to as needed

    // The result of the initialization process can be one of three types:
    // 1. A FirebaseApp instance is returned on successful initialization
    // 2. A timeout error is returned if the initialization process takes longer than 10 seconds
    // 3. A FirebaseException is returned if an error occurs during initialization

    final initialize = ref.watch(firebaseinitializerProvider);

    // Return a MaterialApp with a router and handle the different possible three results of the initialization process using initialize.when()
    return initialize.when(
      // This block is executed if the initialization process is successful and a FirebaseApp instance is returned
      data: (firebaseApp) {
        // Create a router using the createRouter() function that I defined.
        // Then, Build the app UI using MaterialApp.router().
        final router = createRouter();
        return MaterialApp.router(
          theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
      // Shows LoadgingScreen if the initialization process is still ongoing and the result is not yet available.
      loading: () => const MaterialApp(home: Loader()),
      // Show ErrorScreen if an error occurs during the initialization process and a FirebaseException is returned.
      error: (error, stackTrace) =>
          MaterialApp(home: ErrorScreen(error, stackTrace)),
    );
  }
}
