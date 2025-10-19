// ignore_for_file: avoid_print

import 'package:delivery_app/core/class/status_request.dart';
import 'package:delivery_app/core/constant/app_routes.dart';
import 'package:delivery_app/core/function/handling_data.dart';
import 'package:delivery_app/data/datasource/remote/auth/forgetpassword/resetpassword_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswodeController extends GetxController {
  goToSuccessResetPassword();
  showPassword();
}

class ResetPasswodeControllerImp extends ResetPasswodeController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  late TextEditingController password;
  late TextEditingController repassword;
  bool isshowpassword = true;

  @override
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      print("====================Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: "Error", middleText: "Try Again");
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
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
