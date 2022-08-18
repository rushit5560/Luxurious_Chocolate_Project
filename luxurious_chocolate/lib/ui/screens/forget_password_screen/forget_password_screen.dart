import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:luxurious_chocolate/ui/screens/forget_password_screen/forget_password_screen_widgets.dart';

import '../../../controller/forget_password_controller/forget_password_controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: EmailFormModule(),
      ),
    );
  }
}
