import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/wishlist_controller/wishlist_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
import 'package:luxurious_chocolate/ui/screens/wishlist_screen/wishlist_screen_widgets.dart';
import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';
// ignore: import_of_legacy_library_into_null_safe

import '../../../controller/login_controller/login_controller.dart';

class WishlistScreen extends GetView<WishlistController> {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar("My Wishlist".tr),
      body: const SafeArea(
        child: WishlistProductsListModule(),
      ),
    );
  }
}
