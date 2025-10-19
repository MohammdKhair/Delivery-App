import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/app_links.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getAllData() async {
    var response = await crud.postData(AppLinks.ordersPending, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String deliveryid, String usersid, String ordersid) async {
    var response = await crud.postData(AppLinks.ordersApprove,
        {"deliveryid": deliveryid, "usersid": usersid, "ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
