import 'dart:io';

import 'package:delivery_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp(didpop) {
  if (didpop) {
    return;
  } else {
    Get.defaultDialog(
      title: "48".tr,
      middleText: "49".tr,
      titleStyle: const TextStyle(
          fontWeight: FontWeight.bold, color: AppColor.primaryColor),
      onCancel: () => Get.back(),
      cancelTextColor: AppColor.secondColor,
      confirmTextColor: AppColor.secondColor,
      buttonColor: AppColor.thirdColor,
      onConfirm: () => exit(0),
    );
  }
}
