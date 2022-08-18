import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../../data/constants/appcolors.dart';
import '../../../../data/constants/appimages.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(AppImages.appLogo),
          ),
          Expanded(
            child: ListView(
              children: [
                singleListItem(
                  tileIcon: Icons.home_filled,
                  tileText: "Home",
                  onTap: () {},
                ),
                singleListItem(
                  tileIcon: Icons.account_circle,
                  tileText: "Account",
                  onTap: () {},
                ),
                singleListItem(
                  tileIcon: Icons.favorite_rounded,
                  tileText: "Wishlist",
                  onTap: () {},
                ),
                singleListItem(
                  tileIcon: Icons.checklist_rounded,
                  tileText: "Orders",
                  onTap: () {},
                ),
                singleListItem(
                  tileIcon: Icons.home_work_rounded,
                  tileText: "Address",
                  onTap: () {},
                ),
                singleListItem(
                  tileIcon: Icons.contact_support_rounded,
                  tileText: "Contact Us",
                  onTap: () {
                    Get.toNamed(Routes.contactUsScreenRoute);
                  },
                ),
                singleListItem(
                  tileIcon: Icons.newspaper_rounded,
                  tileText: "NewsLetter",
                  onTap: () {},
                ),
              ],
            ),
          ),
          singleListItem(
            tileIcon: Icons.login_rounded,
            tileText: "Register / Login or Logout",
            onTap: () {
              Get.toNamed(Routes.registerScreenRoute);
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
