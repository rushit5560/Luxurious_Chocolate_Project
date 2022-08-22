import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/newsletter_controller/newsletter_controller.dart';
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

import '../../controller/address_controller/address_controller.dart';
import '../../controller/home_controller/home_controller.dart';

class NewsletterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsletterController>(() => NewsletterController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
