
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function() onPressedsearch;
  final void Function() onPressedfavotite;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomAppBar(
      {super.key,
      required this.titleappbar,
      required this.onPressedsearch,
      required this.onPressedfavotite,
      this.onChanged,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            cursorColor: AppColor.primaryColor,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                prefixIcon: IconButton(
                    onPressed: onPressedsearch, icon: const Icon(Icons.search)),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 18),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: IconButton(
                splashRadius: 30,
                onPressed: onPressedfavotite,
                icon: Icon(
                  Get.currentRoute == "/favorite" ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                  color: Colors.grey[600],
                )),
          )
        ],
      ),
    );
  }
}
