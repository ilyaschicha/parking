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
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD6kCqMIkfNd9GgcDDZkyit12u86OBWUhU',
    appId: '1:811460894996:web:984bf06dec1149460a6201',
    messagingSenderId: '811460894996',
    projectId: 'nafea-d03fa',
    authDomain: 'nafea-d03fa.firebaseapp.com',
    databaseURL: 'https://nafea-d03fa-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nafea-d03fa.appspot.com',
    measurementId: 'G-1NRGZXEHCG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFKjQnT7jmDVcaDxobBU9t1UqCu7MKvtA',
    appId: '1:811460894996:android:a3b9d102a91639c00a6201',
    messagingSenderId: '811460894996',
    projectId: 'nafea-d03fa',
    databaseURL: 'https://nafea-d03fa-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nafea-d03fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkR2JKDPyZFiWYHI5paJraR9PGdhIBp3U',
    appId: '1:811460894996:ios:f54956affb2309380a6201',
    messagingSenderId: '811460894996',
    projectId: 'nafea-d03fa',
    databaseURL: 'https://nafea-d03fa-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nafea-d03fa.appspot.com',
    iosClientId: '811460894996-mlp155d5g52q953p830tfoiotigtv14j.apps.googleusercontent.com',
    iosBundleId: 'com.example.parking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkR2JKDPyZFiWYHI5paJraR9PGdhIBp3U',
    appId: '1:811460894996:ios:f54956affb2309380a6201',
    messagingSenderId: '811460894996',
    projectId: 'nafea-d03fa',
    databaseURL: 'https://nafea-d03fa-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nafea-d03fa.appspot.com',
    iosClientId: '811460894996-mlp155d5g52q953p830tfoiotigtv14j.apps.googleusercontent.com',
    iosBundleId: 'com.example.parking',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6kCqMIkfNd9GgcDDZkyit12u86OBWUhU',
    appId: '1:811460894996:web:35b2a9122e163d400a6201',
    messagingSenderId: '811460894996',
    projectId: 'nafea-d03fa',
    authDomain: 'nafea-d03fa.firebaseapp.com',
    databaseURL: 'https://nafea-d03fa-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nafea-d03fa.appspot.com',
    measurementId: 'G-0T7E41BCVJ',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyD6kCqMIkfNd9GgcDDZkyit12u86OBWUhU',
    appId: '1:811460894996:web:48731f60635217230a6201',
    messagingSenderId: '811460894996',
    projectId: 'nafea-d03fa',
    authDomain: 'nafea-d03fa.firebaseapp.com',
    databaseURL: 'https://nafea-d03fa-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nafea-d03fa.appspot.com',
    measurementId: 'G-70FL262SYK',
  );
}
