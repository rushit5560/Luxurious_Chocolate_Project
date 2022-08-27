import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/product_details_controller/product_details_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';
import 'package:luxurious_chocolate/ui/widgets/helper_widgets/helper_toasts.dart';

import 'product_details_screen_widgets.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(controller.productName),
      body: SafeArea(
        child: Obx(
          () => controller.isDataLoading.value
              ? HelperToasts().showMainLoaderGif()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImageCarouselModule(),
                      const SizedBox(height: 15),
                      ProductTitleAndInfoModule(),
                      const SizedBox(height: 15),
                      ProductInStockStatModule(),
                      const SizedBox(height: 15),
                      ProductQuantityModule(),
                      const SizedBox(height: 15),
                      ChocolateColorOptionModule(),
                      const SizedBox(height: 15),
                      ChocolateFillingOptionModule(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AddToCartButtonModule(),
                            const SizedBox(width: 10),
                            AddToWishListModule(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ProductDetailsModule(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
