import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/login_controller/login_controller.dart';
import 'package:luxurious_chocolate/data/constants/api_urls.dart';
import 'package:luxurious_chocolate/data/field_validation.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../controller/product_list_controller/product_list_controller.dart';
import '../../../data/constants/appcolors.dart';
import '../../../data/constants/appimages.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';

class FilterViewProductsModule extends StatefulWidget {
  FilterViewProductsModule({Key? key}) : super(key: key);

  @override
  State<FilterViewProductsModule> createState() =>
      _FilterViewProductsModuleState();
}

class _FilterViewProductsModuleState extends State<FilterViewProductsModule> {
  final proListController = Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    proListController.isGridView.value = true;
                  },
                  icon: const Icon(
                    Icons.grid_view_rounded,
                    size: 26,
                  ),
                  color: proListController.isGridView.value
                      ? AppColors.accentGoldColor
                      : AppColors.blackColor,
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    proListController.isGridView.value = false;
                  },
                  icon: const Icon(
                    Icons.view_list_rounded,
                    size: 28,
                  ),
                  color: proListController.isGridView.value
                      ? AppColors.blackColor
                      : AppColors.accentGoldColor,
                ),
              ],
            ),
          ),
          const SizedBox(width: 60),
          Container(
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
                hint: const Text("Filter By"),
                items: proListController.filterItems.map(
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
                value: proListController.selectedFilterValue.value,
                onChanged: (String? val) {
                  proListController.selectedFilterValue.value = val!;
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

class GridViewProductsModule extends StatelessWidget {
  GridViewProductsModule({Key? key}) : super(key: key);
  final prodListController = Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    var productsList = prodListController.productsListModel!.data;
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: productsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: prodListController.size.height * 0.22,
      ),

      scrollDirection: Axis.vertical,
      // shrinkWrap: true,

      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 8,
      //   mainAxisSpacing: 8,
      //   // mainAxisExtent: 120,
      //   childAspectRatio: 1.9,
      // ),
      itemBuilder: (ctx, ind) {
        return ProductGridSingleItem(
          index: ind,
        );
      },
    );
  }
}

class ProductGridSingleItem extends StatelessWidget {
  ProductGridSingleItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final prodListController = Get.find<ProductListController>();
  @override
  Widget build(BuildContext context) {
    var product = prodListController.productsListModel!.data[index];
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(
              Routes.productDetailsScreenRoute,
              arguments: [
                product.id,
                product.productname,
              ],
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: AppColors.whiteColor,
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.5),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    ApiUrls.iamgePathApiUrl + product.showimg,
                    fit: BoxFit.cover,
                    height: prodListController.size.width * 0.32,
                    width: prodListController.size.width * 0.45,
                  ),
                ),
                // const SizedBox(height: 5),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const SizedBox(height: 5),
                    Text(
                      product.productname,
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // const SizedBox(height: 2),
                    Text(
                      "\$${product.totalcost}",
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        const Positioned(
          right: 8,
          top: 12,
          child: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Center(
              child: Icon(
                Icons.favorite_border_rounded,
                color: AppColors.greyColor,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListViewProductsModule extends StatelessWidget {
  ListViewProductsModule({Key? key}) : super(key: key);
  final prodListController = Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    var productsList = prodListController.productsListModel!.data;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: productsList.length,
      // itemExtent: prodListController.size.width * 0.3,

      scrollDirection: Axis.vertical,
      // shrinkWrap: true,

      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 8,
      //   mainAxisSpacing: 8,
      //   // mainAxisExtent: 120,
      //   childAspectRatio: 1.9,
      // ),
      itemBuilder: (ctx, ind) {
        return ProductListSingleItem(
          index: ind,
        );
      },
    );
  }
}

class ProductListSingleItem extends StatelessWidget {
  ProductListSingleItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final prodListController = Get.find<ProductListController>();
  @override
  Widget build(BuildContext context) {
    var product = prodListController.productsListModel!.data[index];
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(
              Routes.productDetailsScreenRoute,
              arguments: [
                product.id,
                product.productname,
              ],
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
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
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    ApiUrls.iamgePathApiUrl + product.showimg,
                    fit: BoxFit.cover,
                    height: prodListController.size.height * 0.15,
                    width: prodListController.size.width * 0.3,
                  ),
                ),
                const SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productname,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\$${product.totalcost}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
              ],
            ),
          ),
        ),
        const Positioned(
          right: 4,
          top: 4,
          child: Padding(
            padding: EdgeInsets.only(
              right: 5,
              top: 5,
            ),
            child: Center(
              child: Icon(
                Icons.favorite_border_rounded,
                color: AppColors.greyColor,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignInButtonModule extends StatelessWidget {
  SignInButtonModule({Key? key}) : super(key: key);

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Log In",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.whiteColor,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColors.greenColor,
        fixedSize: Size(loginController.size.width, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}

class SignUpTextModule extends StatelessWidget {
  SignUpTextModule({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();
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
