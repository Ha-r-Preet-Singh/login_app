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
    apiKey: 'AIzaSyDIJDdWf3eRJZ2OhtHp2pHybSuO8e7B184',
    appId: '1:422299816023:web:6c25b372c128679ca31312',
    messagingSenderId: '422299816023',
    projectId: 'login-app-b0c7e',
    authDomain: 'login-app-b0c7e.firebaseapp.com',
    storageBucket: 'login-app-b0c7e.appspot.com',
    measurementId: 'G-1X6HBV076P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5zh4qu8A4VxSkviIImtEw-9XLSFbWZtI',
    appId: '1:422299816023:android:4d6e98d5c7106a1da31312',
    messagingSenderId: '422299816023',
    projectId: 'login-app-b0c7e',
    storageBucket: 'login-app-b0c7e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHLlZC_okY5-KjYOWwq2PTMK9Ke15daO8',
    appId: '1:422299816023:ios:a8839b09cd2ecdfaa31312',
    messagingSenderId: '422299816023',
    projectId: 'login-app-b0c7e',
    storageBucket: 'login-app-b0c7e.appspot.com',
    iosBundleId: 'com.example.loginSigUpWithFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHLlZC_okY5-KjYOWwq2PTMK9Ke15daO8',
    appId: '1:422299816023:ios:e6dd4323f2acf006a31312',
    messagingSenderId: '422299816023',
    projectId: 'login-app-b0c7e',
    storageBucket: 'login-app-b0c7e.appspot.com',
    iosBundleId: 'com.example.loginSigUpWithFirebase.RunnerTests',
  );
}
