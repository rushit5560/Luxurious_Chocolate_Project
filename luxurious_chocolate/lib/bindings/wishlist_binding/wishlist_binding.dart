import 'package:get/get.dart';

import '../../controller/home_controller/home_controller.dart';
import '../../controller/wishlist_controller/wishlist_controller.dart';

class WishlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(() => WishlistController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
