import 'package:delivery_app/core/class/handling_data_view.dart';
import 'package:delivery_app/screens/orders/pending/controller/orders_pending_controller.dart';
import 'package:delivery_app/screens/orders/pending/widget/card_orders_list_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: GetBuilder<OrdersPendingControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardOrdersListPending(
                  ordersModel: controller.data[index],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
