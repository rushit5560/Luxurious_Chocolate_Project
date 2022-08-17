import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

class HomeController extends GetxController {
  final size = Get.size;
  RxInt activeIndex = 0.obs;

  PageController carouselController = PageController();
  List<String> bannerImages = [
    "assets/images/banner1.png",
    "assets/images/banner1.png",
    "assets/images/banner1.png",
  ];

  List<Widget>? images = [
    Image.asset(
      "assets/images/banner1.png",
      height: 250,
      width: double.infinity,
      fit: BoxFit.cover,
    )
  ];

  navigateToHomeScreen() {
    Get.off(Routes.homeScreenRoute);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // bannerImages = [
    // AppImages.appLogo,
    // AppImages.appLogo,
    // AppImages.appLogo,
    // ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
