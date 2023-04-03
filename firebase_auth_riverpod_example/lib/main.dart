import 'package:firebase_auth_riverpod_example/features/authentication/pages/erroer_screen.dart';
import 'package:firebase_auth_riverpod_example/features/authentication/pages/loading_screen.dart';
import 'package:firebase_auth_riverpod_example/utils/routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

void main() {
  // Ensure flutter framework to be initialized
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

//  Firebase 실행을 Riverpod를 통해 확인한다.
// 이 방법으로 Loading / error state를 구현할 수 있다.
final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
});

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // initialize의 결과는 총 3가지 이다.
    // 1. 정상 실행: FirebaseApp 반환
    // 2. TIMEOUT: Firebase실행 시간이 10초 이상 걸릴 경우 timeout error 반환
    // 3. 에러: FirebaseException 반환
    final initialize = ref.watch(firebaseinitializerProvider);

    // Render the app with the fetched data
    return initialize.when(
      data: (firebaseApp) {
        final router = createRouter();
        return MaterialApp.router(
          routerConfig: router,
        );
      },
      // lodaing의 경우
      loading: () => const MaterialApp(home: LoadingScreen()),
      // error시 erorSCreen
      error: (error, stackTrace) =>
          MaterialApp(home: ErrorScreen(error, stackTrace)),
    );
  }
}
