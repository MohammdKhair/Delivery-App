// ignore_for_file: avoid_print

import 'package:delivery_app/core/class/status_request.dart';
import 'package:delivery_app/core/constant/app_routes.dart';
import 'package:delivery_app/core/function/handling_data.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  @override
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }



  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("====================Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['delivery_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", "${response['data']['delivery_id']}");
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['delivery_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['delivery_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['delivery_phone']);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("delivery");
            FirebaseMessaging.instance.subscribeToTopic("delivery$userid");
            Get.offNamed(AppRoute.homeScreen);
          } 
        } else {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(
              title: "Error", middleText: "Email Or Password Not Correct");
        }
      }
      update();
      print("Valid");
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   String? token = value;
    //   print("===========$token");
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
