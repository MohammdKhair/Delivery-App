import 'package:delivery_app/core/constant/app_theme.dart';
import 'package:delivery_app/core/function/fcm_config.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeArabic;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestLocationPermission() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  @override
  void onInit() {
    fcmConfig();
    requestLocationPermission();
    requestNotificationPermission();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeArabic;
    }
    super.onInit();
  }
}
