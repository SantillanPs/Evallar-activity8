
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
    apiKey: 'AIzaSyBjOyK0_1sFsU6S0nXXtDmTRf-dGAje3JY',
    appId: '1:257852168671:android:b2cacc4e0143fb2bf3cc6a',
    messagingSenderId: '257852168671',
    projectId: 'mobilec-badd3',
    storageBucket: 'mobilec-badd3.firebasestorage.app',
  );

  // Web config - reuses Android credentials with authDomain added
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBjOyK0_1sFsU6S0nXXtDmTRf-dGAje3JY',
    appId: '1:257852168671:android:b2cacc4e0143fb2bf3cc6a',
    messagingSenderId: '257852168671',
    projectId: 'mobilec-badd3',
    authDomain: 'mobilec-badd3.firebaseapp.com',
    storageBucket: 'mobilec-badd3.firebasestorage.app',
  );
}