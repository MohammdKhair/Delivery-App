import 'package:delivery_app/screens/home_screen/controller/home_screen_controller.dart';
import 'package:delivery_app/screens/home_screen/widget/custom_button_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomAppBarHome extends StatelessWidget {
  const CustomButtomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          height: 70,
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(controller.listPage.length, (i) {
                return CustomButtonAppBar(
                  onPressed: () => controller.changePage(i),
                  textbutton: controller.bottomappbar[i]["title"],
                  iconbutton: controller.currentpage == i
                      ? controller.bottomappbar[i]["icon"]
                      : controller.bottomappbar[i]["icon out"],
                  active: controller.currentpage == i,
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
