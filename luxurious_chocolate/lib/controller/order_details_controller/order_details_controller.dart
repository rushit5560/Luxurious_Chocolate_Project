import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

class OrderDetailsController extends GetxController {
  final size = Get.size;

  final GlobalKey<FormState> formKey = GlobalKey();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  navigateToHomeScreen() {
    Get.off(Routes.homeScreenRoute);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
