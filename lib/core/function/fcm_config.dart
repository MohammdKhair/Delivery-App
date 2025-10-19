// ignore_for_file: avoid_print

import 'package:delivery_app/screens/orders/pending/controller/orders_pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestNotificationPermission() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("==============Notification=================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageByNotification(message.data);
  });
}

refreshPageByNotification(data) {
  print("=========================== page id");
  print(data['pageid']);
  print("=========================== page name");
  print(data['pagename']);
  print("=========================== Current Rout");
  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "orderspending") {
    print("refresh Order=====================================");
    OrdersPendingControllerImp controller = Get.find();
    controller.refreshOrders();
  }
}

// real time method

// Firebase + stream
// Socket io
// Notification refresh
