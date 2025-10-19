
import 'package:delivery_app/core/constant/app_image.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      backgroundColor: Colors.red,
      child: ClipOval(
        child: Image.asset(AppImage.logo),
      ),
    );
  }
}
