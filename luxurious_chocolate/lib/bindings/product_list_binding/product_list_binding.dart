import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/contact_us_controller/contact_us_controller.dart';
import 'package:luxurious_chocolate/controller/forget_password_controller/forget_password_controller.dart';
import 'package:luxurious_chocolate/controller/home_controller/home_controller.dart';
import 'package:luxurious_chocolate/controller/login_controller/login_controller.dart';
import 'package:luxurious_chocolate/controller/product_details_controller/product_details_controller.dart';
import 'package:luxurious_chocolate/controller/product_list_controller/product_list_controller.dart';
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

class ProductListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(() => ProductListController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
  }
}
