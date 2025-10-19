
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBTfae-ke6Do3AaqIGNT1rQmZN4xvdkMLI",
            appId: "1:1004310004415:android:ccf3302bc5ea7086adbc0a",
            messagingSenderId: "1004310004415",
            projectId: "ecommerce-78a79",
            storageBucket: "ecommerce-78a79.firebasestorage.app",
          ),
        )
      : await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async{
  await Get.putAsync(() => MyServices().init());
}
