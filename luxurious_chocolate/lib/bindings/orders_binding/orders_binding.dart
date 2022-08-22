import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/order_details_controller/order_details_controller.dart';

import '../../controller/home_controller/home_controller.dart';
import '../../controller/orders_controller/orders_controller.dart';

class OrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(() => OrdersController());
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
