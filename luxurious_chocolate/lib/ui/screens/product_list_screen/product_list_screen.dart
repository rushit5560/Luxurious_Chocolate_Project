import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/product_list_controller/product_list_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/ui/widgets/helper_widgets/helper_toasts.dart';

import '../../widgets/custom_appbar/custom_appbar.dart';
import 'product_list_screen_widgets.dart';

class ProductListScreen extends GetView<ProductListController> {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(controller.categoryName),
      body: SafeArea(
        child: Obx(
          () => controller.isDataLoading.value
              ? HelperToasts().showMainLoaderGif()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilterViewProductsModule(),
                      const SizedBox(height: 8),
                      controller.productsListModel!.data.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: controller.size.height * 0.25),
                              child: const Text(
                                "No Products available",
                                style: TextStyle(
                                  color: AppColors.accentGoldColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          : controller.isGridView.value
                              ? GridViewProductsModule()
                              : ListViewProductsModule(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
