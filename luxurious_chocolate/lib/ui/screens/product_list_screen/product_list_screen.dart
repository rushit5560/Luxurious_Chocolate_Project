import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/product_list_controller/product_list_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';

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
          () => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                FilterViewProductsModule(),
                const SizedBox(height: 10),
                controller.isGridView.value
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
