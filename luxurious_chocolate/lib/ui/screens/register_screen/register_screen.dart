import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';
import 'package:luxurious_chocolate/ui/screens/register_screen/register_screen_widgets.dart';

import '../../../controller/register_controller/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => controller.isDataLoading.value
            ? const CircularProgressIndicator()
            : SafeArea(
                child: RegistrationFormModule(),
              ),
      ),
    );
  }
}
