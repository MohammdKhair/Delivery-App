// ignore_for_file: avoid_print

import 'package:delivery_app/core/class/status_request.dart';
import 'package:delivery_app/core/constant/app_routes.dart';
import 'package:delivery_app/core/function/handling_data.dart';
import 'package:delivery_app/data/datasource/remote/orders/details_data.dart';
import 'package:delivery_app/data/model/orders_details_model.dart';
import 'package:delivery_app/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';

abstract class OrdersDetailsController extends GetxController {
  getOrdersDetails();
  goToOrdersTracking();
}

class OrdersDetailsControllerImp extends OrdersDetailsController {
  StatusRequest statusRequest = StatusRequest.none;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  OrdersModel? ordersModel;
  List<Marker> markers = [];
  double zoomLevel = 15.0;
  LatLng orderLocation = const LatLng(0, 0);
  List<OrdersDetailsModel> data = [];

  @override
  getOrdersDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersDetailsData.getAllData(ordersModel!.ordersId.toString());
    print("Full Response=========: ${response.toString()}");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersModel"];
    if (ordersModel!.ordersType == 0) {
      orderLocation =
          LatLng(ordersModel!.addressLat!, ordersModel!.addressLong!);
    }
    getOrdersDetails();
    super.onInit();
  }

  @override
  goToOrdersTracking() {
    Get.toNamed(AppRoute.ordersTeacking,
        arguments: {"ordersModel": ordersModel});
  }
}
