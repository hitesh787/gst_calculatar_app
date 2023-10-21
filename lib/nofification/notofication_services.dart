import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class ServicesForNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");

  void initialiseNotification() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Show Notification
  void showNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    flutterLocalNotificationsPlugin.show(
      0,
      "Hello",
      "Calculate the gst for app",
      notificationDetails,
    );
  }


  /// Schedule Notification
  void notificationSchedule() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("channelId 1", "channelName",
            priority: Priority.high, importance: Importance.max);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    /// Schedule Notification
    flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      "Schedule Notification",
      "Gst Calculator Notification ",
      RepeatInterval.everyMinute,
      notificationDetails,
    );
  }


  /// zoned Schedule Notification
  void zonedScheduleNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("channelId 2", "channelName",
            priority: Priority.max, importance: Importance.max);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    /// Time Zone
    flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      "zonedSchedule Notification",
      "zonedSchedule Notification ",
      tz.TZDateTime.from(DateTime.parse("2023-09-23 16:29:04Z"), tz.local),
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }



}
