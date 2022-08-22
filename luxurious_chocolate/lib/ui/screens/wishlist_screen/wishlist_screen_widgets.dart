import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/login_controller/login_controller.dart';
import 'package:luxurious_chocolate/data/field_validation.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../controller/wishlist_controller/wishlist_controller.dart';
import '../../../data/constants/appcolors.dart';
import '../../../data/constants/appimages.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';

class WishlistProductsListModule extends StatelessWidget {
  const WishlistProductsListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      // itemExtent: prodListController.size.width * 0.3,

      scrollDirection: Axis.vertical,

      itemBuilder: (ctx, ind) {
        return ProductListSingleItem();
      },
      separatorBuilder: (ctx, ind) {
        return const SizedBox(height: 12);
      },
    );
  }
}

class ProductListSingleItem extends StatelessWidget {
  ProductListSingleItem({Key? key}) : super(key: key);
  final wishlistController = Get.find<WishlistController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(
              Routes.productDetailsScreenRoute,
              arguments: [
                "Prod Name",
              ],
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: AppColors.whiteColor,
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    "assets/images/choclate1.jpg",
                    fit: BoxFit.cover,
                    height: wishlistController.size.height * 0.15,
                    // width: homeController.size.width * 0.3,
                  ),
                ),
                const SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Prod name",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\$27",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
              ],
            ),
          ),
        ),
        const Positioned(
          right: 4,
          top: 4,
          child: Padding(
            padding: EdgeInsets.only(
              right: 5,
              top: 5,
            ),
            child: Center(
              child: Icon(
                Icons.favorite_rounded,
                color: Colors.red,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
