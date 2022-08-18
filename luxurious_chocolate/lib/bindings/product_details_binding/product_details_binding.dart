import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/home_controller/home_controller.dart';
import 'package:luxurious_chocolate/controller/product_details_controller/product_details_controller.dart';
import 'package:luxurious_chocolate/controller/product_list_controller/product_list_controller.dart';

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
    Get.lazyPut<ProductListController>(() => ProductListController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
