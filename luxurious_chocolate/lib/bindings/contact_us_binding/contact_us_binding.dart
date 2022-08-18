import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/contact_us_controller/contact_us_controller.dart';
import 'package:luxurious_chocolate/controller/forget_password_controller/forget_password_controller.dart';
import 'package:luxurious_chocolate/controller/home_controller/home_controller.dart';
import 'package:luxurious_chocolate/controller/login_controller/login_controller.dart';
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

class ContactUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(() => ContactUsController());

    Get.lazyPut<HomeController>(() => HomeController());
  }
}
