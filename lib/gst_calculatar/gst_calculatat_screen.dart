import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class GstCalculatorApp extends StatefulWidget {
  const GstCalculatorApp({super.key});

  @override
  State<GstCalculatorApp> createState() => _GstCalculatorAppState();
}

class _GstCalculatorAppState extends State<GstCalculatorApp> {

  double price = 0;
  double gstRate = 0;
  double gstAmount = 0;
  double totalAmount = 0;
  double cgstAmount= 0;

  //
  void calculateGST() {
    gstAmount = (price * gstRate) / 100;
    totalAmount = price + gstAmount;
    cgstAmount = gstAmount/2;
    setState(() {});
  }

  // void reverseCalculation() {
  //   price = totalAmount / (1 + gstRate / 100);
  //   gstAmount = totalAmount - price;
  //   setState(() {});
  // }

  //
  @override
  void initState() {
    super.initState();
    scheduleDailyNotifications();
  }

  Future<void> scheduleDailyNotifications() async {

    final targetTime = DateTime.now().add(const Duration(days: 1)); // Set the time for the first notification (e.g., tomorrow)

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'basic_channel', // Replace with your channel key
        title: 'Daily Notification Demo ',
        body: 'This is a daily notification.',
      ),
      schedule: NotificationCalendar(
        day: targetTime.day,
        month: targetTime.month,
        year: targetTime.year,
        hour: 19, // Set the hour for the daily notification (e.g., 7:00 AM)
        minute: 0, // Set the minute for the daily notification (e.g., 0 minutes)
        second: 0,
        millisecond: 0,
        repeats: true, // Set to true to repeat daily
      ),
    );
  }

  // Future<void> showNotificationWithIconsAndActionButtons() async {
  //
  //   AwesomeNotifications().initialize(
  //     '',
  //     [
  //       NotificationChannel(
  //         channelKey: 'basic_channel',
  //         channelName: 'Basic notifications',
  //         channelDescription: 'Notification channel for basic tests',
  //         defaultColor: const Color(0xFF9D50DD),
  //         ledColor: Colors.white,
  //         playSound: true,
  //         importance: NotificationImportance.Max,
  //         defaultRingtoneType: DefaultRingtoneType.Notification,
  //       )
  //     ],
  //   );

  //
  //   await AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //       id: 13,
  //       channelKey: 'basic_channel',
  //       title: 'Anonymous says:',
  //       body: 'Demo Notification for testing purpose use for client',
  //       payload: {'uuid': 'user-profile-uuid'},
  //       displayOnBackground: true,
  //       displayOnForeground: true,
  //     ),
  //     schedule: NotificationCalendar(
  //       second: 10,
  //       repeats: true,
  //     ),
  //
  //   );
  //
  //
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    price = double.tryParse(value) ?? 0;
                  });
                },
                decoration: const InputDecoration(labelText: 'Enter Price'),
              ),

              const SizedBox(height: 20),

              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    gstRate = double.tryParse(value) ?? 0;
                  });
                },
                decoration: const InputDecoration(labelText: 'GST Rate (%)'),
              ),

              const SizedBox(height: 50),

              /// Button For Calculate
              ElevatedButton(
                onPressed: () {
                  calculateGST();
                },
                child: const Text('Calculate GST'),
              ),
              const SizedBox(height: 25),

              ElevatedButton(

                onPressed: () {
                  scheduleDailyNotifications();
              },
                child: const Text('schedule Notification'),
              ),

              const SizedBox(height: 50),

              /// Ans text Widget
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Total GST',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text('$gstAmount',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text(
                          'Post GST Amount',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text('$totalAmount',style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
