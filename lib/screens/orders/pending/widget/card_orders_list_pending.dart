import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/data/model/orders_model.dart';
import 'package:delivery_app/screens/orders/pending/controller/orders_pending_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListPending extends GetView<OrdersPendingControllerImp> {
  final OrdersModel ordersModel;
  const CardOrdersListPending({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${ordersModel.ordersId}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(ordersModel.ordersDatetime.toString()).fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor, fontSize: 18),
                )
              ],
            ),
            const Divider(),
            // Text(
            //     "Order type : ${controller.printTypeOrder(ordersModel.ordersType.toString())}"),
            Text("Order price : ${ordersModel.ordersPrice} \$"),
            Text("delivery price : ${ordersModel.ordersPricedelivery} \$"),
            Text(
                "Payment method : ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod.toString())}"),
            // Text(
            //     "Order Status : ${controller.printOrderStatus(ordersModel.ordersStatus.toString())}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${ordersModel.ordersTotalprice?.toDouble()} \$",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                if (ordersModel.ordersStatus == 2)
                  MaterialButton(
                    onPressed: () {
                      controller.approveOrder(
                          ordersModel.ordersUsersid.toString(),
                          ordersModel.ordersId.toString());
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Approve"),
                  ),
                const SizedBox(width: 5),
                MaterialButton(
                  onPressed: () {
                    controller.goToOrdersDetails(ordersModel);
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                  child: const Text("Details"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
