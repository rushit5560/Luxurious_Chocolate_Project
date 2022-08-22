import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/home_controller/home_controller.dart';
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

import '../../controller/account_controller/account_controller.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
