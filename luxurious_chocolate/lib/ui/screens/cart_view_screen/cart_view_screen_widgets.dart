import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/cart_view_controller/cart_view_controller.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';

import '../../../data/constants/appcolors.dart';

class CartProductsListViewModule extends StatelessWidget {
  CartProductsListViewModule({Key? key}) : super(key: key);
  final cartController = Get.find<CartViewController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return SingleCartProduct();
        }),
        separatorBuilder: (ctx, ind) {
          return const SizedBox(height: 12);
        },
      ),
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  SingleCartProduct({Key? key}) : super(key: key);
  final cartController = Get.find<CartViewController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.15),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 88,
            width: 88,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: Image.asset(
                AppImages.bannerImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: cartController.size.width * 0.35,
                child: const Text(
                  "Oreo Choco truffles ",
                  maxLines: 2,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "\$28.86",
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.delete),
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                iconSize: 25.0,
                color: AppColors.redColor,
                onPressed: () {
                  Get.snackbar("Discarded", "Removed from the cart");
                },
              ),
              // const SizedBox(height: 10),
              QuantityWidget(
                setValue: 1,
                onChanged: (val) {
                  cartController.qtyValue.value = val;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderSummaryDetailsModule extends StatelessWidget {
  const OrderSummaryDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: AppColors.accentGoldColor,
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            SingleSummaryTile(
              title: "Order Summary",
              value: "",
            ),
            const SizedBox(height: 5),
            const Divider(
              color: AppColors.accentGoldColor,
              thickness: 0.5,
            ),
            const SizedBox(height: 15),
            SingleSummaryTile(
              title: "Quantity",
              value: "5",
            ),
            const SizedBox(height: 5),
            SingleSummaryTile(
              title: "Sub Total",
              value: "\$3185",
            ),
            const SizedBox(height: 15),
            const Divider(
              color: AppColors.accentGoldColor,
              thickness: 0.5,
            ),
            SingleSummaryTile(
              title: "Total",
              value: "\$3185",
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class SingleSummaryTile extends StatelessWidget {
  SingleSummaryTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityWidget extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int setValue;

  final ValueChanged<int> onChanged;

  QuantityWidget(
      {Key? key,
      required this.setValue,
      this.minValue = 1,
      this.maxValue = 1000,
      required this.onChanged})
      : super(key: key);

  @override
  State<QuantityWidget> createState() {
    return _QuantityWidgetState();
  }
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    counter = widget.setValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.remove_circle_rounded,
            color: AppColors.accentGoldColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          iconSize: 25.0,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              if (counter > widget.minValue) {
                counter--;
              }
              widget.onChanged(counter);
            });
          },
        ),
        Text(
          '$counter',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.add_circle_rounded,
            color: AppColors.accentGoldColor,
          ),
          iconSize: 25.0,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              if (counter < widget.maxValue) {
                counter++;
              }
              widget.onChanged(counter);
            });
          },
        ),
      ],
    );
  }
}

class CheckoutButtonModule extends StatelessWidget {
  CheckoutButtonModule({Key? key}) : super(key: key);

  final cartController = Get.find<CartViewController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Procesed To Checkout",
              style: TextStyle(
                fontSize: 19,
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
          primary: AppColors.greenColor,
          fixedSize: Size(cartController.size.width, 50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
