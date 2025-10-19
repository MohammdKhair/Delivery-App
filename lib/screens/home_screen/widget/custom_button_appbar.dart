import 'package:delivery_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String textbutton;
  final IconData iconbutton;
  final bool active;
  const CustomButtonAppBar(
      {super.key,
      required this.onPressed,
      required this.textbutton,
      required this.iconbutton,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconbutton,
              color: active == true ? AppColor.primaryColor : AppColor.grey2),
          // Text(
          //   textbutton,
          //   style: TextStyle(
          //       color: active == true ? AppColor.primaryColor : AppColor.grey2),
          // )
        ],
      ),
    );
  }
}
