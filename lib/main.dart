import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'bindings/app_binding.dart';
import 'controllers/app_controller.dart';
import 'firebase_options.dart';
import 'not_found_view.dart';
import 'routes.dart';
import 'services/services.dart';
import 'services/storage_service.dart';
import 'theme/Themes.dart';
import 'utils/app_routes.dart';
import 'utils/dictionary.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Handling a background message: ${message.messageId}");
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  HttpOverrides.global = DevHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await AppServices.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  } catch (e) {
    print(e);
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // titledescription
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Get.put(Dictionary());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        onInit: () {
          Get.put<AppController>(
            AppController(),
            permanent: true,
          );
        },
        scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        title: 'Opex Messaging',
        theme: lightTheme,
        //darkTheme: Themes.darkTheme,
        getPages: Routes.routes,
        initialRoute: Routes.INITIAL,
        unknownRoute: GetPage(
            name: AppRoutes.notFoundPage, page: () => const UnknownView()),
        locale: Get.find<StorageService>().languageCode == "tr"
            ? const Locale('tr', 'TR')
            : const Locale('en', 'UK'), // ui.window.locale,
        supportedLocales: const [
          Locale('en', 'UK'),
          Locale('tr', 'TR'),
          Locale('de', 'DE'),
          Locale('ru', 'RU')
        ],
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        fallbackLocale: const Locale('en', 'UK'),
        //translations: Dictionary(),
        translationsKeys: Get.find<Dictionary>().keys,
        translations: Get.find<Dictionary>(),
        initialBinding: AppBinding());
  }
}

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
