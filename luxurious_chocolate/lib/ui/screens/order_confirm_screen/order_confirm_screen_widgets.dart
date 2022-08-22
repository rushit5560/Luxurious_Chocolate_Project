import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/login_controller/login_controller.dart';
import 'package:luxurious_chocolate/controller/order_confirm_controller/order_confirm_controller.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../data/constants/appcolors.dart';

class OrderConfirmDetailsModule extends StatelessWidget {
  OrderConfirmDetailsModule({Key? key}) : super(key: key);
  final orderConfirmController = Get.find<OrderConfirmController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Thank you !",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: AppColors.accentGoldColor,
            ),
          ),
          const SizedBox(width: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Text(
              "Thanks for subscribing to our news letter. you should receive a confirmation email soon",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w400,
                color: AppColors.greyColor,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GoHomeButtonModule(),
        ],
      ),
    );
  }
}

class GoHomeButtonModule extends StatelessWidget {
  GoHomeButtonModule({Key? key}) : super(key: key);
  final orderConfirmController = Get.find<OrderConfirmController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Go Home",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              // SizedBox(width: 10),
              // Icon(
              //   Icons.arrow_forward_rounded,
              //   color: AppColors.whiteColor,
              // ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: AppColors.accentGoldColor,
            fixedSize: Size(orderConfirmController.size.width / 2, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
          onPressed: () {
            Get.offNamed(Routes.homeScreenRoute);
          },
        ),
      ],
    );
  }
}
