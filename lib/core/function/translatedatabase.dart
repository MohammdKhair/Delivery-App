import 'package:delivery_app/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columar, columen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columar;
  } else {
    return columen;
  }
}
