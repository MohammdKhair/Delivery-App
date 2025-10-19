import 'package:delivery_app/core/class/handling_data_view.dart';
import 'package:delivery_app/core/constant/app_color.dart';
import 'package:delivery_app/screens/orders/tracking/controller/orders_tracking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrdersTeacking extends StatelessWidget {
  const OrdersTeacking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersTrackingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Tracking"),
      ),
      body: GetBuilder<OrdersTrackingControllerImp>(builder: (controller) {
        return controller.currentLocation == null
            ? const Center(child: CircularProgressIndicator())
            : HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    Expanded(
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(
                              controller.currentLocation!.latitude!,
                              controller.currentLocation!.longitude!),
                          initialZoom: controller.zoomLevel,
                          minZoom: 4,
                          maxZoom: 18,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            subdomains: const ['a', 'b', 'c'],
                            userAgentPackageName: 'com.yourapp.yourappname',
                          ),
                          MarkerLayer(
                            markers: controller.markers,
                          ),
                          PolylineLayer(
                            polylines: [
                              Polyline(
                                points: controller.routePoints,
                                strokeWidth: 4.0,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        minWidth: 300,
                        color: AppColor.primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          controller.doneDelivery();
                        },
                        child: const Text("The Order Has Been deliverd"),
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}
