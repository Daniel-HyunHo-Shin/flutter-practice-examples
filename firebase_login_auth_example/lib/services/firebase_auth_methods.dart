import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// FirebaseAuth 클래스 내부에는 아이디 만들기/ 로그인/ 검증 기능 등 다양한 기능이 선언되어 있습니다.
/// 하지만 우리는 이 중 몇개의 기능만을 필요로 합니다.
/// 또한 해당 기능에 몇가지 기능을 동시에 사용하고 싶습니다. 예를 들어 error messeage를 snack bar로
/// 표현하는 기능을 넣고 싶습니다.
/// 이를 실행하는 간단한 방법은 새로운 class를 선언하고 FirebaseAuth의 기능 중 필요한 기능만 안에 선언하는 것입니다.
/// 이와 동시에 try / catch block을 이용해 조건문을 안에 선언하여 세부 동작을 control해주는 것 입니다.
/// 이렇게 함으로서 더 나은 encapsulation을 성취할 수 있습니다.
class FirebaseAuthMethods {
  /// FirebaseAuth는 Firebaseauth sdk의 시작점이 되는 class입니다.
  /// FirebasAuth에는 아이디 제작/ 로그인 검증 등 다양한 method가 이미 선언되어 있습니다.
  /// 우리가 할 일은 미리 선언된 _auth에 정의된 method를 활용하는 것입니다.
  /// auth가 Private하게 정의함으로서 얻는 이득은 무엇일까요?
  /// FirebaseAuth instance가 오직 우리가 FirebasAuthMethods에 정의한 methods만 활용하도록 만들 수 있습니다.
  final FirebaseAuth _auth;

  /// FirebaseAuthMethods의 instance를 만들기 위해서는 FirebaseAuth의 instance를 argument로 pass해야 합니다.
  /// FirebaseAuth의 instance를 만드는 방법은 Firebaseauth에서 getter를 이용하여 정의되어 있습니다.
  FirebaseAuthMethods(this._auth);

  /// Email 가입 기능을 만들어 보겠습니다.
  /// signUpWithEmail의 argument로 전달된 값들을 FirebaseAuth의 createUserWithEmailAndPassword()로 전달합니다.
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      /// If an exception is thrown, errer messeage(e)를 capture합니다.
      /// 만약에 메세지가 null이라면, "An error~ "를 제공합니다.
      final errorMessage =
          e.message ?? 'An error occurred, please try again later.';

      /// Display the error message in a SnackBar
      /// Scaffoldmessenge는 scaffold의 child widget입니다.
      /// 덕분에 Scaffold의 context를 찾을 수 있습니다.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  /// Email Login 기능 만들기
  /// 위의 SignUp 기능과 동일합니다.
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  /// Email verification 기능 만들기
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email Verification sent!')),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }
}
