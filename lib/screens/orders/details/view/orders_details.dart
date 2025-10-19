import 'package:delivery_app/core/class/handling_data_view.dart';
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/core/function/translatedatabase.dart';
import 'package:delivery_app/core/shared/custom_button_default.dart';
import 'package:delivery_app/screens/orders/details/controller/orders_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: GetBuilder<OrdersDetailsControllerImp>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: ListView(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              const TableRow(children: [
                                Text("Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                  Text(
                                      "${translateDatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName)}",
                                      textAlign: TextAlign.center),
                                  Text("${controller.data[index].countitems}",
                                      textAlign: TextAlign.center),
                                  Text("${controller.data[index].itemsPrice}",
                                      textAlign: TextAlign.center),
                                ]),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                "Price : ${double.parse(controller.ordersModel!.ordersTotalprice.toString())}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ),
                  if (controller.ordersModel!.ordersType == 0)
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text("Shipping Address",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.ordersModel!.addressStreet!),
                                Text(controller.ordersModel!.addressCity!),
                              ],
                            ),
                          ),
                          const Divider(
                            indent: 30,
                            endIndent: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 300,
                            width: double.infinity,
                            child: FlutterMap(
                              options: MapOptions(
                                initialCenter: controller.orderLocation,
                                initialZoom: controller.zoomLevel,
                                minZoom: 4,
                                maxZoom: 18,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  subdomains: const ['a', 'b', 'c'],
                                  userAgentPackageName:
                                      'com.yourapp.yourappname',
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: controller.orderLocation,
                                      child: const Icon(
                                        Icons.location_pin,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  // if (controller.ordersModel!.ordersType == 0 &&
                  //     controller.ordersModel!.ordersType == 3)
                    CustomButtonDefault(
                      text: "Tracking",
                      onPressed: () {
                        controller.goToOrdersTracking();
                      },
                    )
                ],
              ),
            ));
      }),
    );
  }
}
