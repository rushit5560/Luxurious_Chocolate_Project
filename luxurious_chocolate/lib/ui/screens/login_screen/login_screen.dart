import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';

import '../../../controller/login_controller/login_controller.dart';
import '../../widgets/helper_widgets/helper_toasts.dart';
import 'login_screen_widgets.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => controller.isDataLoading.value
            ? HelperToasts().showMainLoaderGif()
            : SafeArea(
                child: LoginFormModule(),
              ),
      ),
    );
  }
}
