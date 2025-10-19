
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onTapIcon;
  const CustomTextFormAuth(
      {super.key,
      this.hintText,
      this.labelText,
      this.icon,
      this.controller,
      this.validator,
      this.keyboardType,
      this.obscureText,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 13),
          labelStyle: const TextStyle(color: AppColor.secondColor),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(labelText!),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: icon == Icons.lock_outline
              ? InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: onTapIcon,
                  child: Icon(icon),
                )
              : Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColor.primaryColor)),
        ),
      ),
    );
  }
}
