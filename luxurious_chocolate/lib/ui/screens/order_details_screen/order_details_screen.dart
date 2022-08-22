import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/order_details_controller/order_details_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/ui/screens/newsletter_screen/newsletter_screen_widgets.dart';

import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';

import '../../../controller/newsletter_controller/newsletter_controller.dart';
import 'order_details_screen_widgets.dart';

class OrderDetailsScreen extends GetView<OrderDetailsController> {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar("Order Details"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              const OrderInfoModule(),
              const SizedBox(height: 20),
              OrderUserInfoModule(),
              const SizedBox(height: 20),
              const OrderDetailsModule(),
              const SizedBox(height: 50),
              GeneratePdfButtonModule(),
            ],
          ),
        ),
      ),
    );
  }
}
