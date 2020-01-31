//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<cloud_firestore/CloudFirestorePlugin.h>)
#import <cloud_firestore/CloudFirestorePlugin.h>
#else
@import cloud_firestore;
#endif

#if __has_include(<firebase_auth/FirebaseAuthPlugin.h>)
#import <firebase_auth/FirebaseAuthPlugin.h>
#else
@import firebase_auth;
#endif

#if __has_include(<firebase_core/FirebaseCorePlugin.h>)
#import <firebase_core/FirebaseCorePlugin.h>
#else
@import firebase_core;
#endif

#if __has_include(<firebase_messaging/FirebaseMessagingPlugin.h>)
#import <firebase_messaging/FirebaseMessagingPlugin.h>
#else
@import firebase_messaging;
#endif

#if __has_include(<firebase_storage/FirebaseStoragePlugin.h>)
#import <firebase_storage/FirebaseStoragePlugin.h>
#else
@import firebase_storage;
#endif

#if __has_include(<flutter_inapp_purchase/FlutterInappPurchasePlugin.h>)
#import <flutter_inapp_purchase/FlutterInappPurchasePlugin.h>
#else
@import flutter_inapp_purchase;
#endif

#if __has_include(<flutter_local_notifications/FlutterLocalNotificationsPlugin.h>)
#import <flutter_local_notifications/FlutterLocalNotificationsPlugin.h>
#else
@import flutter_local_notifications;
#endif

#if __has_include(<fluttertoast/FluttertoastPlugin.h>)
#import <fluttertoast/FluttertoastPlugin.h>
#else
@import fluttertoast;
#endif

#if __has_include(<google_sign_in/GoogleSignInPlugin.h>)
#import <google_sign_in/GoogleSignInPlugin.h>
#else
@import google_sign_in;
#endif

#if __has_include(<image_picker/ImagePickerPlugin.h>)
#import <image_picker/ImagePickerPlugin.h>
#else
@import image_picker;
#endif

#if __has_include(<path_provider/PathProviderPlugin.h>)
#import <path_provider/PathProviderPlugin.h>
#else
@import path_provider;
#endif

#if __has_include(<shared_preferences/SharedPreferencesPlugin.h>)
#import <shared_preferences/SharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

#if __has_include(<sqflite/SqflitePlugin.h>)
#import <sqflite/SqflitePlugin.h>
#else
@import sqflite;
#endif

#if __has_include(<square_in_app_payments/SquareInAppPaymentsFlutterPlugin.h>)
#import <square_in_app_payments/SquareInAppPaymentsFlutterPlugin.h>
#else
@import square_in_app_payments;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTCloudFirestorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTCloudFirestorePlugin"]];
  [FLTFirebaseAuthPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseAuthPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [FLTFirebaseMessagingPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseMessagingPlugin"]];
  [FLTFirebaseStoragePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseStoragePlugin"]];
  [FlutterInappPurchasePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterInappPurchasePlugin"]];
  [FlutterLocalNotificationsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterLocalNotificationsPlugin"]];
  [FluttertoastPlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttertoastPlugin"]];
  [FLTGoogleSignInPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleSignInPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
  [SquareInAppPaymentsFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"SquareInAppPaymentsFlutterPlugin"]];
}

@end
