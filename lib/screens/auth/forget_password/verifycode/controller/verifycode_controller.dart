// ignore_for_file: avoid_print

import 'package:delivery_app/core/class/status_request.dart';
import 'package:delivery_app/core/constant/app_routes.dart';
import 'package:delivery_app/core/function/handling_data.dart';
import 'package:delivery_app/data/datasource/remote/auth/forgetpassword/verifycode_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  @override
  goToResetPassword(String verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(email!, verifycode);
    print("====================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "Error", middleText: "Verify Code Not Correct");
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
