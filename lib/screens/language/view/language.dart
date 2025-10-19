
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/core/constant/app_routes.dart';
import 'package:delivery_app/core/localization/changelocal.dart';
import 'package:delivery_app/screens/language/widgets/custom_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColor.black),
                ),
                const SizedBox(height: 20),
                CustomButtonLang(
                    textbutton: "Ar",
                    onPressed: () {
                      Get.offNamed(AppRoute.login);
                      controller.changeLang("ar");
                    }),
                CustomButtonLang(
                    textbutton: "En",
                    onPressed: () {
                      Get.offNamed(AppRoute.login);
                      controller.changeLang("en");
                    }),
              ],
            ),
          )),
    );
  }
}
