import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // Ensure flutter framework to be initialized
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

//  Firebase 실행확인을 Riverpod를 통해 확인한다.
// 이 방법으로 Loading / error state를 구현할 수 있다.
final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(firebaseinitializerProvider);

    // Go router package를 이용할 것이므로 MaterialApp.router
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
    );
  }
}
