import 'package:delivery_app/core/class/handling_data_view.dart';
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/core/function/validinput.dart';
import 'package:delivery_app/screens/auth/forget_password/resetpassword/controller/resetpassword_controller.dart';
import 'package:delivery_app/screens/auth/widgets/custom_button_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_body_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_form_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text("33".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ResetPasswodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    CustomTextTitleAuth(text: "34".tr),
                    const SizedBox(height: 15),
                    CustomTextBodyAuth(text: "35".tr),
                    const SizedBox(height: 10),
                    GetBuilder<ResetPasswodeControllerImp>(
                        builder: (controller) {
                      return Column(
                        children: [
                          CustomTextFormAuth(
                            obscureText: controller.isshowpassword,
                            onTapIcon: controller.showPassword,
                            validator: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.password,
                            hintText: "17".tr,
                            icon: Icons.lock_outline,
                            labelText: "16".tr,
                          ),
                          CustomTextFormAuth(
                            obscureText: controller.isshowpassword,
                            onTapIcon: controller.showPassword,
                            validator: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.repassword,
                            hintText: "38".tr,
                            icon: Icons.lock_outline,
                            labelText: "16".tr,
                          )
                        ],
                      );
                    }),
                    const SizedBox(height: 30),
                    CustomButtonAuth(
                        text: "36".tr,
                        onPressed: () {
                          controller.goToSuccessResetPassword();
                        }),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
