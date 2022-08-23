import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart' as sp;
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return sp.SplashScreen(
      seconds: 4,
      navigateAfterSeconds: Routes.homeScreenRoute,
      // title: const Text(
      //   'Welcome To\nLuxurious Chocolate',
      //   textAlign: TextAlign.center,
      //   style: TextStyle(
      //     height: 1.6,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 28,
      //   ),
      // ),

      image: Image.asset(
        AppImages.appLogo,
        height: controller.size.height * 0.25,
        width: controller.size.height * 0.25,
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.white,
      loaderColor: AppColors.appBarColor,
      // loadingText: const Text(
      //   'Wait a moment',
      //   style: TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontSize: 20.0,
      //   ),
      // ),
      photoSize: controller.size.height * 0.1,
      useLoader: true,
      
    );
  }
}
