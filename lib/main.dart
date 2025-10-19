import 'package:delivery_app/binding/initial_binding.dart';
import 'package:delivery_app/core/localization/changelocal.dart';
import 'package:delivery_app/core/localization/translation.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      getPages: routes,
    );
  }
}
