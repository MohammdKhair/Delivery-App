import 'package:delivery_app/core/class/handling_data_view.dart';
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/core/function/alertexitapp.dart';
import 'package:delivery_app/core/function/validinput.dart';
import 'package:delivery_app/screens/auth/login/controller/login_controller.dart';
import 'package:delivery_app/screens/auth/widgets/custom_button_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_body_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_form_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_title_auth.dart';
import 'package:delivery_app/screens/auth/widgets/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text("11".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              alertExitApp(didPop);
            },
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Padding(
                        padding: const EdgeInsets.only(right: 35, left: 35),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              const SizedBox(height: 30),
                              const LogoAuth(),
                              const SizedBox(height: 20),
                              CustomTextTitleAuth(text: "12".tr),
                              const SizedBox(height: 15),
                              CustomTextBodyAuth(text: "13".tr),
                              const SizedBox(height: 20),
                              CustomTextFormAuth(
                                validator: (val) {
                                  return validInput(val!, 5, 100, "email");
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: controller.email,
                                hintText: "15".tr,
                                icon: Icons.email_outlined,
                                labelText: "14".tr,
                              ),
                              GetBuilder<LoginControllerImp>(
                                  builder: (controller) {
                                return CustomTextFormAuth(
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
                                );
                              }),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.goToForgetPassword();
                                      },
                                      child: Text(
                                        "18".tr,
                                        style: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomButtonAuth(
                                  text: "11".tr,
                                  onPressed: () {
                                    controller.login();
                                  }),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
