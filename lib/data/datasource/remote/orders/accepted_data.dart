import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/app_links.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliveryid) async {
    var response =
        await crud.postData(AppLinks.ordersAccepted, {"deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }

  doneDelivery(String usersid, String ordersid) async {
    var response = await crud.postData(
        AppLinks.ordersDone, {"usersid": usersid, "ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
