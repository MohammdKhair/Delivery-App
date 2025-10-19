

import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/app_links.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(AppLinks.addressView, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLinks.addressAdd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(AppLinks.addressDelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
