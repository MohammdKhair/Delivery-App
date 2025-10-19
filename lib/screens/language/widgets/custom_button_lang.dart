import 'package:delivery_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColor.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      onPressed: onPressed,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        textbutton,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
