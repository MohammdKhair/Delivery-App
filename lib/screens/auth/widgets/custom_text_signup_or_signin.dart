import 'package:delivery_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const CustomTextSignUpOrSignIn(
      {super.key, required this.text1, required this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1.tr),
        InkWell(
          onTap: onTap,
          child: Text(
            text2.tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
