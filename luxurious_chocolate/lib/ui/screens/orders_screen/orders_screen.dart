import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/orders_controller/orders_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:luxurious_chocolate/controller/splash_controller/splash_controller.dart';
import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';

import '../../../controller/login_controller/login_controller.dart';
import '../../../controller/order_details_controller/order_details_controller.dart';
import 'orders_screen_widgets.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar("My Orders".tr),
      body: SafeArea(
        child: OrdersListViewModule(),
      ),
    );
  }
}
