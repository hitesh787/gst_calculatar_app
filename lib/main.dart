import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:gst_calculatar_app/gst_calculatar/gst_calculatat_screen.dart';
import 'package:gst_calculatar_app/nofification/local_notification_screen.dart';
import 'package:gst_calculatar_app/nofification/notofication_services.dart';
import 'package:timezone/data/latest.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZones();
  AwesomeNotifications().initialize(
    '',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        playSound: true,
        importance: NotificationImportance.Max,
        defaultRingtoneType: DefaultRingtoneType.Notification,
      )
    ],
  );

  // await AndroidAlarmManager.initialize();
  // await AndroidAlarmManager.periodic(
  //     const Duration(seconds: 10),
  //     0,()
  //     async {
  //       AwesomeNotifications().initialize(
  //         '',
  //         [
  //           NotificationChannel(
  //             channelKey: 'basic_channel',
  //             channelName: 'Basic notifications',
  //             channelDescription: 'Notification channel for basic tests',
  //             defaultColor: const Color(0xFF9D50DD),
  //             ledColor: Colors.white,
  //             playSound: true,
  //             importance: NotificationImportance.Max,
  //             defaultRingtoneType: DefaultRingtoneType.Notification,
  //           )
  //         ],
  //       );
  //       await AwesomeNotifications().createNotification(
  //         content: NotificationContent(
  //           id: 1,
  //           channelKey: 'basic_channel',
  //           title: 'Anonymous says:',
  //           body: 'Demo Notification for Testing Purpose ',
  //           payload: {'uuid': 'user-profile-uuid'},
  //           displayOnBackground: true,
  //           displayOnForeground: true,
  //         ),
  //         schedule: NotificationCalendar(
  //           second: 10,
  //           repeats: true,
  //         ),
  //       );
  //     },
  //     exact: true,
  //     wakeup: true,
  // );

  runApp(const MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GstCalculatorApp(),
    );
  }
}

