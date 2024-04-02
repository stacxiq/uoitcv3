import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:uoitc_new_app/app.dart';
import 'package:uoitc_new_app/core/routing/app_router.dart';
import 'package:uoitc_new_app/core/networking/dio_factory.dart';
import 'package:uoitc_new_app/core/services/authservice/auth_service.dart';
import 'package:uoitc_new_app/core/shared/functions/easy_loding.dart';
import 'package:uoitc_new_app/firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);
void showNotification(RemoteMessage? message) {
  flutterLocalNotificationsPlugin.show(
      0,
      message!.notification!.title,
      message.notification!.body,
      payload: jsonEncode(message.data),
      NotificationDetails(
          android: AndroidNotificationDetails(
              channel.id, channel.name, // channel.description,
              importance: Importance.high,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher')));
}

void subscribeToTopic() async {
  try {
    await FirebaseMessaging.instance.subscribeToTopic('notification');
  } catch (e) {
    print(e);
  }
}

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    await Hive.initFlutter();
    await AuthService.impl().openAuthBox();
    await NetworkManager.initializeInterceptors();

    FirebaseMessaging.instance
        .requestPermission(sound: true, badge: true, alert: true);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    subscribeToTopic();
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      if (Platform.isAndroid) {
        showNotification(message);
      }
    });

    configLoading();

    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://49f2791205068b057cc0da1eb841e37f@o4506945707704320.ingest.us.sentry.io/4507007527813120';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(MyApp(
        appRouter: AppRouter(),
      )),
    );
  }, (error, stackTrace) async {
    await Sentry.captureException(error, stackTrace: stackTrace);
  });
}
