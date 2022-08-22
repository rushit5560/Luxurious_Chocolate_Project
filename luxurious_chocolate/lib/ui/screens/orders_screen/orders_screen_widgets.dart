import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders_controller/orders_controller.dart';
import '../../../data/constants/appcolors.dart';
import '../../../routes/app_pages.dart';

class OrdersListViewModule extends StatelessWidget {
  OrdersListViewModule({Key? key}) : super(key: key);
  final ordersController = Get.find<OrdersController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(12),
      //   ),
      //   border: Border.all(
      //     color: AppColors.accentGoldColor,
      //     width: 1,
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 10),
          // const Text(
          //   "  Order History",
          //   style: TextStyle(
          //     color: AppColors.blackColor,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 20,
          //   ),
          // ),
          // const SizedBox(height: 10),
          // Divider(
          //   thickness: 1,
          //   color: AppColors.accentGoldColor,
          // ),
          // const SizedBox(height: 15),
          Expanded(child: OrdersList()),
        ],
      ),
    );
  }
}

class OrdersList extends StatelessWidget {
  OrdersList({Key? key}) : super(key: key);
  final ordersController = Get.find<OrdersController>();
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
        return OrderListSingleItem();
      },
      separatorBuilder: (ctx, ind) {
        return const SizedBox(height: 12);
      },
    );
  }
}

class OrderListSingleItem extends StatelessWidget {
  OrderListSingleItem({Key? key}) : super(key: key);

  final ordersController = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            // Get.toNamed(
            //   Routes.productDetailsScreenRoute,
            //   arguments: [
            //     "Prod Name",
            //   ],
            // );
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
                SizedBox(width: 10),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: Image.asset(
                        "assets/images/choclate1.jpg",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                        // width: homeController.size.width * 0.3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Order".tr + " No. ",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "938638",
                            style: TextStyle(
                              color: AppColors.accentGoldColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Price".tr + " : ",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$30",
                            style: TextStyle(
                              color: AppColors.greenColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Date".tr + " : ",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "2022-08-16 05:11:49",
                            style: TextStyle(
                              color: AppColors.accentGoldColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Status".tr + " : ",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Pending",
                            style: TextStyle(
                              color: AppColors.redColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 2),
              ],
            ),
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: Padding(
            padding: EdgeInsets.only(
              right: 5,
              top: 5,
            ),
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.orderDetailsScreenRoute);
              },
              child: Text("View".tr),
              style: TextButton.styleFrom(
                primary: AppColors.whiteColor,
                backgroundColor: AppColors.greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpTextModule extends StatelessWidget {
  SignUpTextModule({Key? key}) : super(key: key);
  final ordersController = Get.find<OrdersController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "I don't have an account? -",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Text(
            " Sign Up Now",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.greenColor,
            ),
          ),
        ),
      ],
    );
  }
}
