import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/home_controller/home_controller.dart';

import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/ui/screens/home_screen/home_screen_widgets.dart';
import 'package:luxurious_chocolate/ui/widgets/helper_widgets/helper_toasts.dart';

import '../../../data/constants/appimages.dart';
import '../../widgets/custom_drawer/custom_drawer.dart';

class HomeScreen extends GetView<HomeController> {
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
        leading: Obx(
          () => controller.isDataLoading.value
              ? const SizedBox()
              : IconButton(
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
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(
            AppImages.appLogo,
            height: 45,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: Obx(
        () => controller.isDataLoading.value
            ? HelperToasts().showMainLoaderGif()
            : SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await controller.getBannerList();
                    await controller.getGeneralSettingApi();
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const BannerListModule(),
                        const SizedBox(height: 5),
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
              ),
      ),
    );
  }
}
