// ignore_for_file: avoid_print

import 'dart:async';

import 'package:delivery_app/core/class/status_request.dart';
import 'package:delivery_app/core/constant/app_routes.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/model/orders_model.dart';
import 'package:delivery_app/screens/orders/accepted/controller/accepted_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class OrdersTrackingController extends GetxController {
  getCurrentLocation();
  getRoute();
  doneDelivery();
  //refreshLocation();
}

class OrdersTrackingControllerImp extends OrdersTrackingController {
  OrdersAcceptedControllerImp ordersAcceptedControllerImp = Get.find();
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Timer? timer;
  OrdersModel? ordersModel;
  double zoomLevel = 15.0;
  final MapController mapController = MapController();
  LocationData? currentLocation;
  List<LatLng> routePoints = [];
  List<Marker> markers = [];
  final String orsApiKey =
      'eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6Ijk2MmNjMGQ1ZTY4OTRiNjRiNzhkNDdjZTBjY2FiNjk4IiwiaCI6Im11cm11cjY0In0=';

  @override
  Future<void> getCurrentLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    var location = Location();

    try {
      var userLocation = await location.getLocation();

      currentLocation = userLocation;
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(userLocation.latitude!, userLocation.longitude!),
          child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
        ),
      );

      statusRequest = StatusRequest.success;
      update();
    } on Exception {
      currentLocation = null;
      statusRequest = StatusRequest.serverException;
    }

    location.onLocationChanged.listen((LocationData newLocation) {
      currentLocation = newLocation;
      print("===========$currentLocation===========");
      update();
    });
    getRoute();
  }

  @override
  Future<void> getRoute() async {
    if (currentLocation == null) return;

    LatLng start =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    LatLng destination =
        LatLng(ordersModel!.addressLat!, ordersModel!.addressLong!);
    final response = await http.get(
      Uri.parse(
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coords =
          data['features'][0]['geometry']['coordinates'];

      routePoints = coords.map((coord) => LatLng(coord[1], coord[0])).toList();
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: destination,
          child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
        ),
      );
      update();
    } else {
      // Handle errors
      print('========Failed to fetch route==========');
    }
  }

  @override
  doneDelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    await ordersAcceptedControllerImp.doneDelivery(
        ordersModel!.ordersUsersid.toString(),
        ordersModel!.ordersId.toString());
    Get.offAllNamed(AppRoute.homeScreen);
  }

  // @override
  // refreshLocation() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   timer = Timer.periodic(const Duration(seconds: 10), (timer) {
  //     FirebaseFirestore.instance
  //         .collection("delivery")
  //         .doc(ordersModel!.ordersId.toString())
  //         .set({
  //       "lat": currentLocation,
  //       "long": currentLocation,
  //       "deliveryid": myServices.sharedPreferences.getString('id')
  //     });
  //   });
  // }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersModel"];
    getCurrentLocation();
    // refreshLocation();
    super.onInit();
  }
}
