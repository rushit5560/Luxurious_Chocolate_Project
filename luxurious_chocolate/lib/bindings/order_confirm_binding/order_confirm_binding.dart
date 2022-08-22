import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/checkout_controller/checkout_controller.dart';
import 'package:luxurious_chocolate/controller/home_controller/home_controller.dart';
import 'package:luxurious_chocolate/controller/order_confirm_controller/order_confirm_controller.dart';
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

import '../../controller/account_controller/account_controller.dart';

class OrderConfirmBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderConfirmController>(() => OrderConfirmController());
    Get.lazyPut<CheckoutController>(() => CheckoutController());
  }
}
