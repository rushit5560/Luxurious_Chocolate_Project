import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
