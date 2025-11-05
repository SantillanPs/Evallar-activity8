
// ============================================
// firebase_options.dart
// ============================================
// This file contains your Firebase configuration
// Replace the values below with your actual Firebase project credentials
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Check for web first, as it's more reliable than defaultTargetPlatform
    if (kIsWeb) {
      return web;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return android; // Reuse Android config for iOS
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ${defaultTargetPlatform.name}',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Android Firebase config from google-services.json
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBH0KNivLQA1VMGr8Nwt-slqExvQgLUJM4',
    appId: '1:606102785559:android:62c35df74978d4dab55652',
    messagingSenderId: '606102785559',
    projectId: 'activity-4-47631',
    storageBucket: 'activity-4-47631.firebasestorage.app',
  );

  // Web config - reuses Android credentials with authDomain added
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBH0KNivLQA1VMGr8Nwt-slqExvQgLUJM4',
    appId: '1:606102785559:android:62c35df74978d4dab55652',
    messagingSenderId: '606102785559',
    projectId: 'activity-4-47631',
    authDomain: 'activity-4-47631.firebaseapp.com',
    storageBucket: 'activity-4-47631.firebasestorage.app',
  );
}