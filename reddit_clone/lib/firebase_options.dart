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
    apiKey: 'AIzaSyBiRp05X-mU_pC0AXz5NHroKFXSpbQHCEQ',
    appId: '1:82044355703:web:2d502f65d51d5840e1f272',
    messagingSenderId: '82044355703',
    projectId: 'reddit-clone-tutorial-bd06c',
    authDomain: 'reddit-clone-tutorial-bd06c.firebaseapp.com',
    storageBucket: 'reddit-clone-tutorial-bd06c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOE6Fn0Q1lZ7LCYhAzgrdN609j8TGtIbw',
    appId: '1:82044355703:android:69f0d538b73e402fe1f272',
    messagingSenderId: '82044355703',
    projectId: 'reddit-clone-tutorial-bd06c',
    storageBucket: 'reddit-clone-tutorial-bd06c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4IDJJjn0HeKqJAzqRV-rB7Ecg8mO06tk',
    appId: '1:82044355703:ios:399440176c3cbcc8e1f272',
    messagingSenderId: '82044355703',
    projectId: 'reddit-clone-tutorial-bd06c',
    storageBucket: 'reddit-clone-tutorial-bd06c.appspot.com',
    iosClientId: '82044355703-fmunbuva0a9gvorlvgt4lka9hac6a152.apps.googleusercontent.com',
    iosBundleId: 'com.example.redditClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4IDJJjn0HeKqJAzqRV-rB7Ecg8mO06tk',
    appId: '1:82044355703:ios:399440176c3cbcc8e1f272',
    messagingSenderId: '82044355703',
    projectId: 'reddit-clone-tutorial-bd06c',
    storageBucket: 'reddit-clone-tutorial-bd06c.appspot.com',
    iosClientId: '82044355703-fmunbuva0a9gvorlvgt4lka9hac6a152.apps.googleusercontent.com',
    iosBundleId: 'com.example.redditClone',
  );
}