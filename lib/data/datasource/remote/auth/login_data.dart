
import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/app_links.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLinks.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
