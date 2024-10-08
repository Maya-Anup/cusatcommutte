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
    apiKey: 'AIzaSyAty7UsrAzfA_-vifbglDoQA1aFXZFJZBg',
    appId: '1:717085492616:web:72e819dd36e71ed546663d',
    messagingSenderId: '717085492616',
    projectId: 'carpoolingapp-60709',
    authDomain: 'carpoolingapp-60709.firebaseapp.com',
    storageBucket: 'carpoolingapp-60709.appspot.com',
    measurementId: 'G-N6R1C35RBP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9IOzogx6b2a06cH_K2URS31er2xKN79w',
    appId: '1:717085492616:android:df6d9a991b9f9e8646663d',
    messagingSenderId: '717085492616',
    projectId: 'carpoolingapp-60709',
    storageBucket: 'carpoolingapp-60709.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpibACc2kqR5CunjjYl13O77JQZLsDbeo',
    appId: '1:717085492616:ios:fd88ac69225bc76146663d',
    messagingSenderId: '717085492616',
    projectId: 'carpoolingapp-60709',
    storageBucket: 'carpoolingapp-60709.appspot.com',
    iosBundleId: 'com.example.carpoolingApp',
  );
}
