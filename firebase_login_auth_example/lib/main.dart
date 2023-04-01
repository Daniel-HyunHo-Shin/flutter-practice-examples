import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Firebase실행 전 Flutter Framework가 실행되게 하는 코드
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase를 실행하는 코드
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Flutter App의 Root 위젯인 MainApp을 실행
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,

      /// 실제 홈화면 UI 구성은 HomePage를 살펴보세요.
      home: const HomePage(),
    );
  }
}
