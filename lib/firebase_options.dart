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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeJMfrbUukOxJvTB0-1b8eO0EH3VWX0m4',
    appId: '1:199293205107:android:0146a307df84f59f76c806',
    messagingSenderId: '199293205107',
    projectId: 'thread2-eunhee',
    storageBucket: 'thread2-eunhee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-hrrR1bz_o-9H1dBDtUaiZRDotW4retA',
    appId: '1:199293205107:ios:4b90700b848e503b76c806',
    messagingSenderId: '199293205107',
    projectId: 'thread2-eunhee',
    storageBucket: 'thread2-eunhee.appspot.com',
    iosBundleId: 'com.nomadcoders-thread.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-hrrR1bz_o-9H1dBDtUaiZRDotW4retA',
    appId: '1:199293205107:ios:72867ad5e356251676c806',
    messagingSenderId: '199293205107',
    projectId: 'thread2-eunhee',
    storageBucket: 'thread2-eunhee.appspot.com',
    iosBundleId: 'com.example.threads',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDK3A7WO0JwQSt96RkTGCY3qoucLWZJqT4',
    appId: '1:199293205107:web:c397b060ed0aa0a276c806',
    messagingSenderId: '199293205107',
    projectId: 'thread2-eunhee',
    authDomain: 'thread2-eunhee.firebaseapp.com',
    storageBucket: 'thread2-eunhee.appspot.com',
  );

}