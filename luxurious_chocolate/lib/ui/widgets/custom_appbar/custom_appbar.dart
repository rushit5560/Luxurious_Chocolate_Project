import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';

import '../../../data/constants/enums.dart';

class CommonAppBar extends StatelessWidget {
  final Widget title;
  final AppBarOption? appBarOption;

  //Function? onTap;

  const CommonAppBar({
    Key? key,
    required this.title,
    required this.appBarOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: Get.width,
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   bottomRight: Radius.circular(25),
        //   bottomLeft: Radius.circular(25),
        // ),
        color: AppColors.whiteColor,
        //color: Colors.grey
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftSideButton(),
            Row(
              children: [
                /*Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.vendorImg),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),*/

                title,
                // Text(
                //   title,
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 16,
                //     color: AppColors.blackColor,
                //   ),
                // ),
              ],
            ),
            rightSideButton(),
          ],
        ),
      ),
    );
  }

  Widget leftSideButton() {
    return GestureDetector(
      onTap: () {
        // if (appBarOption == AppBarOption.singleBackButtonOption ||
        //     appBarOption == AppBarOption.userConversationScreen) {
        Get.back();
        // }
      },
      child: SizedBox(
        height: 50, width: 50,
        child: appBarOption == AppBarOption.singleBackButtonOption
            ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              )
            : null,

        // appBarOption == AppBarOption.singleBackButtonOption
        //     ? Image.asset(AppImages.backArrowImg)
        //     : appBarOption == AppBarOption.userConversationScreen
        //         ? Image.asset(AppImages.backArrowImg)
        //         : appBarOption == AppBarOption.none
        //             ? null
        //             : Container(),
      ),
    );
  }

  Widget rightSideButton() {
    return const SizedBox(
      height: 50,
      width: 50,
    );
  }
}
