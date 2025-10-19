import 'package:delivery_app/core/class/handling_data_view.dart';
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/core/function/validinput.dart';
import 'package:delivery_app/screens/auth/forget_password/forgetpassword/controller/forgetpassword_controller.dart';
import 'package:delivery_app/screens/auth/widgets/custom_button_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_body_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_form_auth.dart';
import 'package:delivery_app/screens/auth/widgets/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text("18".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    CustomTextTitleAuth(text: "29".tr),
                    const SizedBox(height: 15),
                    CustomTextBodyAuth(text: "30".tr),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 30),
                    CustomButtonAuth(
                        text: "28".tr,
                        onPressed: () {
                          controller.checkEmail();
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
