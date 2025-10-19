// ignore_for_file: avoid_print


import 'package:delivery_app/core/class/status_request.dart';
import 'package:delivery_app/core/constant/app_routes.dart';
import 'package:delivery_app/core/function/handling_data.dart';
import 'package:delivery_app/data/datasource/remote/auth/forgetpassword/checkemail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkEmail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print("====================Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCode, arguments: {"email": email.text});
        } else {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: "Error", middleText: "Email Not Found");
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
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
