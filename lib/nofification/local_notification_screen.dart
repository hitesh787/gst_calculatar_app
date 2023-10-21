import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gst_calculatar_app/nofification/notofication_services.dart';



class LocalNotificationScreen extends StatefulWidget {
  const LocalNotificationScreen({super.key});

  @override
  State<LocalNotificationScreen> createState() => _LocalNotificationScreenState();
}

class _LocalNotificationScreenState extends State<LocalNotificationScreen> {


  ServicesForNotification servicesForNotification = ServicesForNotification();


  @override
  void initState() {
    super.initState();
    // start();
    servicesForNotification.initialiseNotification();
    servicesForNotification.zonedScheduleNotification();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [

            ElevatedButton(onPressed: (){
              servicesForNotification.showNotification();
            }, child: const Text("Send Push Notification"),
            ),


            const SizedBox(height: 50),

            ElevatedButton(onPressed: (){
              servicesForNotification.notificationSchedule();
            }, child: const Text("Schedule Notification"),
            ),

            const SizedBox(height: 50),

            ElevatedButton(onPressed: (){
              servicesForNotification.zonedScheduleNotification();
            }, child: const Text("zonedSchedule Notification"),
            ),


          ],
        ),
      ),
    );
  }
}
