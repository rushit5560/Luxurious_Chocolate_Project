import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

import '../../controller/address_controller/address_controller.dart';
import '../../controller/home_controller/home_controller.dart';

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(() => AddressController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
