import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/newsletter_controller/newsletter_controller.dart';
import 'package:luxurious_chocolate/controller/orders_controller/orders_controller.dart';
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

import '../../controller/address_controller/address_controller.dart';
import '../../controller/home_controller/home_controller.dart';
import '../../controller/order_details_controller/order_details_controller.dart';

class OrderDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
    Get.lazyPut<OrdersController>(() => OrdersController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
