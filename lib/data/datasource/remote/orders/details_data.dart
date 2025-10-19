import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/app_links.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getAllData(String ordersid) async {
    var response =
        await crud.postData(AppLinks.ordersDetails, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
