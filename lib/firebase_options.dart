// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCkUdS6BJWXehV_UmvEHlCgJAl9h9kV8ss',
    appId: '1:440451181740:web:27d0dc8da670ba0ddec309',
    messagingSenderId: '440451181740',
    projectId: 'j-shopper-flutter',
    authDomain: 'j-shopper-flutter.firebaseapp.com',
    storageBucket: 'j-shopper-flutter.firebasestorage.app',
    measurementId: 'G-KM7TG2J8BG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdGk0OIB-Qf_PWkU-FuEHTVK2p3QPg-io',
    appId: '1:440451181740:android:a6d3d503e970187fdec309',
    messagingSenderId: '440451181740',
    projectId: 'j-shopper-flutter',
    storageBucket: 'j-shopper-flutter.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIR6SK4_P6Ufvb_d8GU-uIApLV2guu7W4',
    appId: '1:440451181740:ios:bf79fa437e3718e0dec309',
    messagingSenderId: '440451181740',
    projectId: 'j-shopper-flutter',
    storageBucket: 'j-shopper-flutter.firebasestorage.app',
    iosBundleId: 'com.example.jCourier',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIR6SK4_P6Ufvb_d8GU-uIApLV2guu7W4',
    appId: '1:440451181740:ios:bf79fa437e3718e0dec309',
    messagingSenderId: '440451181740',
    projectId: 'j-shopper-flutter',
    storageBucket: 'j-shopper-flutter.firebasestorage.app',
    iosBundleId: 'com.example.jCourier',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCkUdS6BJWXehV_UmvEHlCgJAl9h9kV8ss',
    appId: '1:440451181740:web:653885ce6e7b4143dec309',
    messagingSenderId: '440451181740',
    projectId: 'j-shopper-flutter',
    authDomain: 'j-shopper-flutter.firebaseapp.com',
    storageBucket: 'j-shopper-flutter.firebasestorage.app',
    measurementId: 'G-X8T0T17MRB',
  );
}
