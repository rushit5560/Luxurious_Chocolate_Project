import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../controller/product_details_controller/product_details_controller.dart';
import '../../../data/constants/appcolors.dart';

class ProductImageCarouselModule extends StatelessWidget {
  ProductImageCarouselModule({Key? key}) : super(key: key);
  final proDetailsController = Get.find<ProductDetailsController>();
  @override
  Widget build(BuildContext context) {
    var product = proDetailsController.productDetailsModel!.data[0];
    return Column(
      children: [
        SizedBox(
          height: proDetailsController.size.height * 0.35,
          width: double.infinity,
          child: PageView.builder(
            itemCount: product.images.length,
            allowImplicitScrolling: true,
            itemBuilder: (context, index) {
              return Image.asset(
                AppImages.detailsBgChocoImage,
                fit: BoxFit.cover,
                // height: proDetailsController.size.height * 0.35,
                // width: double.infinity,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(
            imagesLength: product.images.length,
            currentIndex: 0,
          ),
        )
      ],
    );
  }

  List<Widget> indicators({imagesLength, currentIndex}) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? AppColors.appBarColor : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }
}

class ProductTitleAndInfoModule extends StatelessWidget {
  ProductTitleAndInfoModule({Key? key}) : super(key: key);
  final proDetailsController = Get.find<ProductDetailsController>();
  @override
  Widget build(BuildContext context) {
    var productDetails = proDetailsController.productDetailsModel!.data[0];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productDetails.productname,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "\$${productDetails.productcost}",
            style: const TextStyle(
              color: AppColors.greenColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            productDetails.fullText,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductInStockStatModule extends StatelessWidget {
  ProductInStockStatModule({Key? key}) : super(key: key);
  final proDetailsController = Get.find<ProductDetailsController>();
  @override
  Widget build(BuildContext context) {
    var product = proDetailsController.productDetailsModel!.data[0];

    if (product.outofStockStatus.contains("instock")) {
      proDetailsController.isProdInStock.value = true;

      log("product is in stock : ${proDetailsController.isProdInStock.value}");
    } else {
      proDetailsController.isProdInStock.value = false;
      log("product is in stock : ${proDetailsController.isProdInStock.value}");
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: proDetailsController.isProdInStock.value == true
                  ? AppColors.greenColor
                  : AppColors.redColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            proDetailsController.isProdInStock.value == true
                ? "instock"
                : "out of stock",
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductQuantityModule extends StatelessWidget {
  ProductQuantityModule({Key? key}) : super(key: key);
  final proDetailsController = Get.find<ProductDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Quantity  : ",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          // const SizedBox(width: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: QuantityWidget(
              onChanged: (val) {
                proDetailsController.selectedQuantityValue.value = val;
              },
              maxValue:
                  proDetailsController.productDetailsModel!.data[0].quantity,
            ),
          ),
        ],
      ),
    );
  }
}

class ChocolateColorOptionModule extends StatefulWidget {
  ChocolateColorOptionModule({Key? key}) : super(key: key);

  @override
  State<ChocolateColorOptionModule> createState() =>
      _ChocolateColorOptionModuleState();
}

class _ChocolateColorOptionModuleState
    extends State<ChocolateColorOptionModule> {
  final proDetailsController = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Chocolate Color",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            ":",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: proDetailsController.size.width * 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: AppColors.accentGoldColor,
                style: BorderStyle.solid,
                width: 0.80,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isDense: true,
                iconSize: 20,
                hint: const Text("Choose Color"),
                items: proDetailsController.colorItems.map(
                  (value) {
                    return DropdownMenuItem<String>(
                      // onTap: () {
                      //   proListController.selectedFilterValue.value = value;
                      // },
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                value: proDetailsController.selectedChocoColorValue.value,
                onChanged: (String? val) {
                  proDetailsController.selectedChocoColorValue.value = val!;
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChocolateFillingOptionModule extends StatefulWidget {
  ChocolateFillingOptionModule({Key? key}) : super(key: key);

  @override
  State<ChocolateFillingOptionModule> createState() =>
      _ChocolateFillingOptionModuleState();
}

class _ChocolateFillingOptionModuleState
    extends State<ChocolateFillingOptionModule> {
  final proDetailsController = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Chocolate Filling",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            ":",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          // const SizedBox(width: 10),
          Container(
            width: proDetailsController.size.width * 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: AppColors.accentGoldColor,
                style: BorderStyle.solid,
                width: 0.80,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isDense: true,
                iconSize: 20,
                hint: const Text("Choose Filling"),
                items: proDetailsController.fillingItems.map(
                  (value) {
                    return DropdownMenuItem<String>(
                      // onTap: () {
                      //   proListController.selectedFilterValue.value = value;
                      // },
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                value: proDetailsController.selectedChocoFillingValue.value,
                onChanged: (String? val) {
                  proDetailsController.selectedChocoFillingValue.value = val!;
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddToCartButtonModule extends StatelessWidget {
  AddToCartButtonModule({Key? key}) : super(key: key);
  final proDetailsController = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 50,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Add To Cart",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.shopping_cart_rounded,
              color: AppColors.whiteColor,
              size: 24,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.greenColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
        onPressed: () {
          Get.toNamed(
            Routes.cartViewScreenRoute,
            arguments: [
              "Oreo Truffles box",
            ],
          );
        },
      ),
    );
  }
}

class AddToWishListModule extends StatelessWidget {
  AddToWishListModule({Key? key}) : super(key: key);
  final proDetailsController = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 60,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Add To Wishlist",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.favorite_rounded,
              color: AppColors.whiteColor,
              size: 24,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.redColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
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

class ProductDetailsModule extends StatelessWidget {
  ProductDetailsModule({Key? key}) : super(key: key);
  final proDetailsController = Get.find<ProductDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "Product Detail".tr,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            color: AppColors.accentGoldColor,
            thickness: 0.6,
          ),
          const SizedBox(height: 12),
          const Text(
            "Product gagdfah efasfojolfeufy efuiefh Product gagdfah efasfojolfeufy efuiefh Product gagdfah efasfojolfeufy efuiefh Product gagdfah efasfojolfeufy efuiefh",
            maxLines: null,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
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

  final ValueChanged<int> onChanged;

  const QuantityWidget({
    Key? key,
    this.minValue = 1,
    this.maxValue = 1000,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<QuantityWidget> createState() {
    return _QuantityWidgetState();
  }
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    log("maximum quantity count is : ${widget.maxValue}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(
            Icons.remove_circle_rounded,
            color: AppColors.accentGoldColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
          iconSize: 32.0,
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
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
          iconSize: 32.0,
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
