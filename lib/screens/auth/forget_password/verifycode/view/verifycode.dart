import 'package:delivery_app/core/class/handling_data_view.dart';
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/screens/auth/forget_password/verifycode/controller/verifycode_controller.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_body_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text("31".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: ListView(
                children: [
                  const SizedBox(height: 30),
                  CustomTextTitleAuth(text: "37".tr),
                  const SizedBox(height: 15),
                  CustomTextBodyAuth(text: "${"32".tr} ${controller.email}"),
                  const SizedBox(height: 10),
                  OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(15),
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToResetPassword(verificationCode);
                    }, // end onSubmit
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
