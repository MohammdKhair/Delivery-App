import 'package:delivery_app/screens/orders/accepted/view/accepted.dart';
import 'package:delivery_app/screens/orders/pending/view/orders_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const Text(""),
  ];

  List bottomappbar = [
    {
      "title": "Pending",
      "icon": Icons.pending_actions,
      "icon out": Icons.pending_actions_outlined
    },
    {
      "title": "Accepted",
      "icon": Icons.archive,
      "icon out": Icons.archive_outlined
    },
    {
      "title": "Setting",
      "icon": Icons.settings,
      "icon out": Icons.settings_outlined
    },
  ];

  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
