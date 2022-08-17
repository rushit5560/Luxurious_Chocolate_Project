import 'package:get/get.dart';
import 'package:luxurious_chocolate/bindings/forget_password_binding/forget_password_binding.dart';
import 'package:luxurious_chocolate/bindings/home_binding/home_binding.dart';
import 'package:luxurious_chocolate/bindings/login_binding/login_binding.dart';
import 'package:luxurious_chocolate/bindings/register_binding/register_binding.dart';

import 'package:luxurious_chocolate/bindings/splash_binding/splash_binding.dart';
import 'package:luxurious_chocolate/ui/screens/forget_password_screen/forget_password_screen.dart';
import 'package:luxurious_chocolate/ui/screens/home_screen/home_screen.dart';
import 'package:luxurious_chocolate/ui/screens/login_screen/login_screen.dart';
import 'package:luxurious_chocolate/ui/screens/register_screen/register_screen.dart';
import 'package:luxurious_chocolate/ui/screens/splash_screen/splash_screen.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.homeScreenRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),

    //auth pages
    GetPage(
      name: Routes.registerScreenRoute,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.loginScreenRoute,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreenRoute,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
  ];
}
