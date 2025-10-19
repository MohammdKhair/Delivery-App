
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/screens/auth/forget_password/success_resetpassword/controller/successresetpassword_controller.dart';
import 'package:delivery_app/screens/auth/widgets/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp successResetPasswordControllerImp =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("40".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "42".tr,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20),
            Text(
              "43".tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                    text: "41".tr,
                    onPressed: () {
                      successResetPasswordControllerImp.goToLogin();
                    })),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
