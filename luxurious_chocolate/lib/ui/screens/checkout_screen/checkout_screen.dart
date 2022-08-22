import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/checkout_controller/checkout_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';

import '../../../controller/login_controller/login_controller.dart';
import 'checkout_screen_widgets.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar("Checkout"),
      body: Obx(
        () => controller.isLoading.value
            ? const CircularProgressIndicator()
            : SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      BillingDetailsModule(),
                      OrderSummaryModule(),
                      PaymentMethodModule(),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
