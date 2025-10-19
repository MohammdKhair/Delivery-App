import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/data/model/orders_model.dart';
import 'package:delivery_app/screens/orders/accepted/controller/accepted_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListAccepted extends GetView<OrdersAcceptedControllerImp> {
  final OrdersModel ordersModel;
  const CardOrdersListAccepted({super.key, required this.ordersModel});

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
                if (ordersModel.ordersStatus == 3)
                  MaterialButton(
                    onPressed: () {
                      controller.doneDelivery(
                          ordersModel.ordersUsersid.toString(),
                          ordersModel.ordersId.toString());
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Done"),
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
