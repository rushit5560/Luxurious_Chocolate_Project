import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';

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
    return const Center(
      child: SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          color: AppColors.whiteColor,
          strokeWidth: 3,
        ),
      ),
    );
  }

  showCircularAccentLoader() {
    return const Center(
      child: SizedBox(
        height: 35,
        width: 35,
        child: CircularProgressIndicator(
          color: AppColors.accentGoldColor,
          strokeWidth: 3,
        ),
      ),
    );
  }

  showMainLoaderGif() {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Image.asset(
          AppImages.loaderGifAnimation,
          height: 125.0,
          width: 125.0,
        ),
      ),
    );
  }
}
