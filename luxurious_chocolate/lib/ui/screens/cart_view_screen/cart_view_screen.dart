import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/cart_view_controller/cart_view_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';

import 'cart_view_screen_widgets.dart';

class CartViewScreen extends GetView<CartViewController> {
  const CartViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar("My Cart".tr),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CartProductsListViewModule(),
                      const OrderSummaryDetailsModule(),
                      const SizedBox(height: 20),
                      CheckoutButtonModule(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
