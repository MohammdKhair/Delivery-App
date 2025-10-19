

import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/app_links.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getAllData(String delivery) async {
    var response =
        await crud.postData(AppLinks.ordersArchive, {"usersid": delivery});
    return response.fold((l) => l, (r) => r);
  }
}
