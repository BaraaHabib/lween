

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/features/auth/params/update_token_params.dart';
import 'package:lween/features/auth/repo/account_repository.dart';
import 'package:lween/features/notifications/screens/widgets/notification_item.dart';
import 'package:lween/injection_container.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future initFcmNotifications() async {
    final appState = sl<AppStateModel>();
    final res = await Permission.notification.request();
    if (res.isGranted) {
      final newFCMToken = await FirebaseMessaging.instance.getToken();
      FirebaseMessaging.instance.subscribeToTopic(generalFCMTopic);
      if (newFCMToken != appState.firebaseToken) {
        appState.updateFcmToken(newFCMToken);
        sl<AccountRepository>().updateToken(
          UpdateTokenParams(
            body: UpdateTokenParamsBody(
              oldToken: appState.firebaseToken,
              newToken: newFCMToken,
            ),
          ),
        );
      }
    }
    final startUpNotification = await FirebaseMessaging.instance
        .getInitialMessage();
    if (startUpNotification != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        NotificationController.onTap(startUpNotification.data);
      });
    }
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      NotificationController.onTap(event.data);
    });
    FirebaseMessaging.onMessage.listen((event) {
      showNotification(event);
    });
    initLocalNotifications();
  }


  var initializationSettingsAndroid =
  const AndroidInitializationSettings('@mipmap/launcher_icon');
  var initializationSettingsIOS = const DarwinInitializationSettings();
  late InitializationSettings initializationSettings;

  initLocalNotifications(){

    initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onSelectNotification);
  }

  Future onSelectNotification(NotificationResponse payload) async {
    final data = json.decode(payload.payload ?? '{}');
    NotificationController.onTap(data);
  }
  void showNotification(RemoteMessage event,) async {
    await flutterLocalNotificationsPlugin
        .show(
      0,
      event.notification?.title ?? '',
      event.notification?.body ?? '',
      const NotificationDetails(
        android: AndroidNotificationDetails('high_importance_channel','high_importance_channel'),
        iOS: DarwinNotificationDetails(),
      ),
      payload:  json.encode(event.data),
    );
  }

}