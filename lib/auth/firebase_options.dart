
// ============================================
// firebase_options.dart
// ============================================
// This file contains your Firebase configuration
// Replace the values below with your actual Firebase project credentials
// from the google-services.json (Android) or GoogleService-Info.plist (iOS)

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Replace with your Android Firebase config from google-services.json
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'current_key',           
    appId: 'mobilesdk_app_id',       
    messagingSenderId: 'project_number', 
    projectId: 'project_id',          
    storageBucket: 'storage_bucket',
  );

  }