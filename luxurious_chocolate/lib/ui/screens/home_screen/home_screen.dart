import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/constants/enums.dart';
import 'package:luxurious_chocolate/ui/screens/home_screen/home_screen_widgets.dart';
import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';
import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_drawer/custom_drawer.dart';

import '../../../data/constants/appimages.dart';

class HomeScreen extends GetView<SplashController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.foldKey,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            controller.foldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu_open_rounded,
            color: AppColors.appBarColor,
            size: 28,
          ),
          color: AppColors.appBarColor,
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(
            AppImages.appLogo,
            height: 45,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const BannerListModule(),
              ChocolateCategoriesListModule(),
              const SizedBox(height: 5),
              TopProductsListModule(),
              const SizedBox(height: 15),
              WebsiteDetailsListModule(),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}