// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC1VzfRM5jZjUq5EP7pIIc599peLJY_jOY',
    appId: '1:789714404654:web:2bd200fd893661c10166bf',
    messagingSenderId: '789714404654',
    projectId: 'firebase-riverpod',
    authDomain: 'fir-riverpod-9bb4d.firebaseapp.com',
    storageBucket: 'firebase-riverpod.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeiW1nplIoZxU9Z8aUlusFv62kps3C8XY',
    appId: '1:789714404654:android:4ac96ea6897485b20166bf',
    messagingSenderId: '789714404654',
    projectId: 'firebase-riverpod',
    storageBucket: 'firebase-riverpod.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBO5jOCwGm8pexmzfDNvUqU_8iZBFS9ZFw',
    appId: '1:789714404654:ios:fb046b59eee5bb620166bf',
    messagingSenderId: '789714404654',
    projectId: 'firebase-riverpod',
    storageBucket: 'firebase-riverpod.appspot.com',
    iosClientId: '789714404654-um9phtnkr711qacn5nh342obt3e1il0p.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthRiverpodExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBO5jOCwGm8pexmzfDNvUqU_8iZBFS9ZFw',
    appId: '1:789714404654:ios:fb046b59eee5bb620166bf',
    messagingSenderId: '789714404654',
    projectId: 'firebase-riverpod',
    storageBucket: 'firebase-riverpod.appspot.com',
    iosClientId: '789714404654-um9phtnkr711qacn5nh342obt3e1il0p.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthRiverpodExample',
  );
}