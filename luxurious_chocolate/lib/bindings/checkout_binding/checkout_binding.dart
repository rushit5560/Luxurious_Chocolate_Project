import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/cart_view_controller/cart_view_controller.dart';
import 'package:luxurious_chocolate/controller/checkout_controller/checkout_controller.dart';
import 'package:luxurious_chocolate/controller/home_controller/home_controller.dart';
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

import '../../controller/account_controller/account_controller.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(() => CheckoutController());
    Get.lazyPut<CartViewController>(() => CartViewController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
