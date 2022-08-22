import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/order_confirm_controller/order_confirm_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';

import '../../../controller/login_controller/login_controller.dart';
import 'order_confirm_screen_widgets.dart';

class OrderConfirmScreen extends GetView<OrderConfirmController> {
  const OrderConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppColors.accentGoldColor,
        ),
        backgroundColor: AppColors.whiteColor,
        title: const Text("Order Confirmed"),
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios_new_rounded,
        //     color: AppColors.accentGoldColor,
        //   ),
        // ),
        // automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: OrderConfirmDetailsModule(),
      ),
    );
  }
}
