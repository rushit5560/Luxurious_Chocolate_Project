import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/home_controller/home_controller.dart';
import 'package:luxurious_chocolate/data/constants/user_details.dart';
import 'package:luxurious_chocolate/data/sharedpreference_data/sharedpreference_data.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../../data/constants/appcolors.dart';
import '../../../../data/constants/appimages.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(AppImages.appLogo),
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
          ),
          Expanded(
            child: ListView(
              children: [
                singleListItem(
                  tileIcon: Icons.home_filled,
                  tileText: "Home".tr,
                  onTap: () {
                    Get.back();
                  },
                ),
                CategoriesDropDownField(),
                singleListItem(
                  tileIcon: Icons.account_circle,
                  tileText: 'My Account'.tr,
                  onTap: () {
                    Get.toNamed(Routes.accountScreenRoute);
                  },
                ),
                singleListItem(
                  tileIcon: Icons.favorite_rounded,
                  tileText: "My Wishlist".tr,
                  onTap: () {
                    Get.toNamed(Routes.wishlistScreenRoute);
                  },
                ),
                singleListItem(
                  tileIcon: Icons.checklist_rounded,
                  tileText: "My Orders".tr,
                  onTap: () {
                    Get.toNamed(Routes.ordersScreenRoute);
                  },
                ),
                singleListItem(
                  tileIcon: Icons.home_work_rounded,
                  tileText: "Address".tr,
                  onTap: () {
                    Get.toNamed(Routes.addressScreenRoute);
                  },
                ),
                singleListItem(
                  tileIcon: Icons.contact_support_rounded,
                  tileText: "Contact Us".tr,
                  onTap: () {
                    Get.toNamed(Routes.contactUsScreenRoute);
                  },
                ),
                singleListItem(
                  tileIcon: Icons.newspaper_rounded,
                  tileText: "Newsletters".tr,
                  onTap: () {
                    Get.toNamed(Routes.newsLetterScreenRoute);
                  },
                ),
                singleListItem(
                  tileIcon: Icons.language_rounded,
                  tileText: "Language".tr,
                  onTap: () {
                    homeController.ChangeLanguageAlertDialog(context);
                  },
                ),
              ],
            ),
          ),
          singleListItem(
            tileIcon: Icons.login_rounded,
            tileText: UserDetails.isUserLoggedIn == true
                ? "Logout".tr
                : "Registration".tr,
            onTap: () {
              if (UserDetails.isUserLoggedIn == true) {
                SharedPreferenceData().clearUserLoginDetailsFromPrefs();
                Get.toNamed(Routes.initial);
              } else {
                Get.toNamed(Routes.registerScreenRoute);
              }
            },
          ),
        ],
      ),
    );
  }

  ListTile singleListItem({
    required IconData tileIcon,
    required String tileText,
    required Function()? onTap,
  }) {
    return ListTile(
      leading: Icon(
        tileIcon,
        color: AppColors.accentGoldColor,
      ),
      minLeadingWidth: 40,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      title: Text(
        tileText,
        style: const TextStyle(
            color: AppColors.accentGoldColor,
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
      dense: true,
      onTap: onTap,
    );
  }
}

class CategoriesDropDownField extends StatelessWidget {
  CategoriesDropDownField({Key? key}) : super(key: key);

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              const Icon(
                Icons.line_style_rounded,
                color: AppColors.accentGoldColor,
              ),
              const SizedBox(width: 28),
              Expanded(
                child: Text(
                  "Categories".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentGoldColor,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
        // builder: (ctx, wid1, wid2) {
        //   return Container();
        // },
        collapsed: Container(),
        expanded: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: homeController.categoryList
              .map(
                (val) => CategoryListItem(
                  titleText: val,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  CategoryListItem({Key? key, required this.titleText}) : super(key: key);

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      style: ListTileStyle.drawer,
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      leading: Container(
        width: 20,
      ),
      title: Row(
        children: [
          Text(
            titleText,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
