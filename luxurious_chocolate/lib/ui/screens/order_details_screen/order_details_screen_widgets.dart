import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/login_controller/login_controller.dart';
import 'package:luxurious_chocolate/controller/newsletter_controller/newsletter_controller.dart';
import 'package:luxurious_chocolate/data/field_validation.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../controller/order_details_controller/order_details_controller.dart';
import '../../../controller/wishlist_controller/wishlist_controller.dart';
import '../../../data/constants/appcolors.dart';
import '../../../data/constants/appimages.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';

class OrderInfoModule extends StatelessWidget {
  const OrderInfoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(
              Icons.info_outline_rounded,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              "Note :",
              style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "Click here a show Attachment Document",
          style: TextStyle(
            color: Colors.blue.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.lens_blur_rounded,
                  color: AppColors.blackColor,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  "Order 35, Inc.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            const Text(
              "Date: 16/08/2022",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class OrderUserInfoModule extends StatelessWidget {
  OrderUserInfoModule({Key? key}) : super(key: key);
  final orderDetailsController = Get.find<OrderDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        OrderFromDetails(),
        OrderToDetails(),
      ],
    );
  }
}

class OrderToDetails extends StatelessWidget {
  const OrderToDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            "To",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Uasret",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            "arf",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            "w54u6",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            "Phone: 1536547890",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            "info@bshgrsggsfdgeddk.com",
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderFromDetails extends StatelessWidget {
  const OrderFromDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "From",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Admin, Inc.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            "asdasd",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            "asasd",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            "Phone: 1234567890",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            "info@almasaeedstfsfsffudio.com",
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailsModule extends StatelessWidget {
  const OrderDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableHeaderNamesModule(),
        const SizedBox(height: 8),
        const Divider(
          height: 1,
          color: AppColors.accentGoldColor,
        ),
        const SizedBox(height: 8),
        TableListItemModule(),
      ],
    );
  }
}

class TableHeaderNamesModule extends StatelessWidget {
  TableHeaderNamesModule({Key? key}) : super(key: key);
  final orderDetailsController = Get.find<OrderDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: orderDetailsController.size.width * 0.48,
          child: const Text(
            "Product",
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Subtotal",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                "Qty",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                "Total",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TableListItemModule extends StatelessWidget {
  TableListItemModule({Key? key}) : super(key: key);

  final orderDetailsController = Get.find<OrderDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: orderDetailsController.size.width * 0.5,
          child: const Text(
            "demo is prodycras na,e nbut asi nowecoplet",
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "\$450",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                "1",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                "\$450",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GeneratePdfButtonModule extends StatelessWidget {
  GeneratePdfButtonModule({Key? key}) : super(key: key);

  final orderDetailsController = Get.find<OrderDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Generate Pdf",
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
              primary: AppColors.blueColor,
              fixedSize: Size(orderDetailsController.size.width, 45),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
