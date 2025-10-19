import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/app_links.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);
  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifycode, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
