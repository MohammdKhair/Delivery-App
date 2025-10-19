
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomButtonDefault extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonDefault({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
