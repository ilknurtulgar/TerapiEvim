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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBUZT5uiEDCTp17tJ0f32dNqVqkg7I-Rbg',
    appId: '1:279850256529:web:bce81ab79942153176d730',
    messagingSenderId: '279850256529',
    projectId: 'terapi-evim',
    authDomain: 'terapi-evim.firebaseapp.com',
    storageBucket: 'terapi-evim.appspot.com',
    measurementId: 'G-CVQC37675N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCe3foUS3RU_U7BmNl2XNweccEHs7_bSW8',
    appId: '1:279850256529:android:41c4f5c959b1252876d730',
    messagingSenderId: '279850256529',
    projectId: 'terapi-evim',
    storageBucket: 'terapi-evim.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPq1xuX1YJv2reoeUxHmKTDapQLSn62ro',
    appId: '1:279850256529:ios:9deb909aa3e5ae1976d730',
    messagingSenderId: '279850256529',
    projectId: 'terapi-evim',
    storageBucket: 'terapi-evim.appspot.com',
    iosClientId:
        '279850256529-rjue6gstgu9rhv3cv1ra8hm3b507fqiq.apps.googleusercontent.com',
    iosBundleId: 'com.terapievim.terapievim',
  );
}
