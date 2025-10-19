
import 'package:delivery_app/core/constant/app_routes.dart';
import 'package:delivery_app/core/middleware/mymiddleware.dart';
import 'package:delivery_app/screens/auth/forget_password/forgetpassword/view/forgetpassword.dart';
import 'package:delivery_app/screens/auth/forget_password/resetpassword/view/resetpassword.dart';
import 'package:delivery_app/screens/auth/forget_password/success_resetpassword/view/success_resetpassword.dart';
import 'package:delivery_app/screens/auth/forget_password/verifycode/view/verifycode.dart';
import 'package:delivery_app/screens/auth/login/view/login.dart';
import 'package:delivery_app/screens/home_screen/view/home_screen.dart';
import 'package:delivery_app/screens/language/view/language.dart';
import 'package:delivery_app/screens/orders/details/view/orders_details.dart';
import 'package:delivery_app/screens/orders/tracking/view/orders_tracking.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // Language
  GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      middlewares: [MyMiddleWare()]),
  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  // Home
  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  // Orders
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersTeacking, page: () => const OrdersTeacking()),
];
