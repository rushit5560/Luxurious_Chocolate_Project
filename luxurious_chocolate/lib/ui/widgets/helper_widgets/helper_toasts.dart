import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/appcolors.dart';

class HelperToasts {
  showTopToast({
    required String title,
    required String message,
  }) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.accentGoldColor,
      colorText: AppColors.whiteColor,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    );
  }

  showCircularWhiteLoader() {
    return const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: AppColors.whiteColor,
        strokeWidth: 3,
      ),
    );
  }
}
