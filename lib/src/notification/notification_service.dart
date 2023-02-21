import 'dart:io';
import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initializePlatformNotifications() async {
    await _localNotifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('ic_stat'),
        iOS: IOSInitializationSettings(
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestAlertPermission: true,
        ),
      ),
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    return NotificationDetails(
      android: _getAndroidNotifcationDetails(),
      iOS: _getIOSNotificationDetails(),
    );
  }

  IOSNotificationDetails _getIOSNotificationDetails() {
    return const IOSNotificationDetails(threadIdentifier: "delivery");
  }

  AndroidNotificationDetails _getAndroidNotifcationDetails() {
    return const AndroidNotificationDetails(
      'delivery',
      'Delivery tracker',
      groupKey: 'com.sabbar.delivery',
      channelDescription: 'channel to track delivery notifications',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',
      color: Color(0xff2196f3),
    );
  }

  Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    await _localNotifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
