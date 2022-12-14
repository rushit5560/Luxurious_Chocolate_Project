import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/home_controller/home_controller.dart';
import 'package:luxurious_chocolate/data/constants/api_urls.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
import 'package:luxurious_chocolate/ui/widgets/helper_widgets/helper_toasts.dart';

class BannerListModule extends StatefulWidget {
  const BannerListModule({Key? key}) : super(key: key);

  @override
  State<BannerListModule> createState() => _BannerListModuleState();
}

class _BannerListModuleState extends State<BannerListModule> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var bannerList = homeController.bannerListModel!.data;

    return Obx(
      () => SizedBox(
          height: homeController.size.height * 0.25,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: bannerList.length,
                  pageSnapping: true,
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  controller: homeController.carouselController,
                  onPageChanged: (ind) {
                    homeController.activeIndex.value = ind;
                  },
                  itemBuilder: (context, pagePosition) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Image.network(
                            ApiUrls.iamgePathApiUrl +
                                bannerList[pagePosition].imagePath,
                            height: homeController.size.height * 0.25,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            // loadingBuilder: (ctx, bt, bce) {
                            //   return HelperToasts().showCircularAccentLoader();
                            // },
                          ),
                          Positioned(
                            bottom: 60,
                            left: 35,
                            child: Text(
                              bannerList[pagePosition].title,
                              style: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            left: 35,
                            child: Text(
                              bannerList[pagePosition]
                                  .content
                                  .split(">")[1]
                                  .split("<")[0],
                              style: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(
                  homeController.bannerImages.length,
                  homeController.activeIndex,
                ),
              )
            ],
          )),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
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

class ChocolateCategoriesListModule extends StatelessWidget {
  ChocolateCategoriesListModule({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var categoriesList = homeController.categoriesListModel!.data;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Text(
            "Chocolate Categories",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          padding: const EdgeInsets.all(8),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoriesList.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            // mainAxisExtent: 120,
            childAspectRatio: 1.9,
          ),
          itemBuilder: (ctx, ind) {
            return CategorySingleItem(
              index: ind,
            );
          },
        ),
      ],
    );
  }
}

class CategorySingleItem extends StatelessWidget {
  CategorySingleItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var categoriesList = homeController.categoriesListModel!.data;
    return Stack(
      children: [
        Image.asset(
          "assets/images/catimage1.png",
          fit: BoxFit.fill,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: homeController.size.width * 0.4,
                    child: Text(
                      categoriesList[index].categoryName,
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(
                        Routes.productListScreenRoute,
                        arguments: [
                          categoriesList[index].categoryId,
                          categoriesList[index].categoryName,
                        ],
                      );
                    },
                    child: const Text(
                      "Show",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class TopProductsListModule extends StatelessWidget {
  TopProductsListModule({Key? key}) : super(key: key);

  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Text(
            "Top Products".tr,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: homeController.size.height * 0.24,
          width: double.infinity,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            itemExtent: 150,

            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,

            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 8,
            //   mainAxisSpacing: 8,
            //   // mainAxisExtent: 120,
            //   childAspectRatio: 1.9,
            // ),
            itemBuilder: (ctx, ind) {
              return TopProductSingleItem();
            },
          ),
        ),
      ],
    );
  }
}

class TopProductSingleItem extends StatelessWidget {
  TopProductSingleItem({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: AppColors.whiteColor,
            border: Border.all(
              color: AppColors.greyColor.withOpacity(0.5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  "assets/images/choclate1.jpg",
                  fit: BoxFit.cover,
                  height: homeController.size.width * 0.3,
                  // width: homeController.size.width * 0.3,
                ),
              ),
              // const SizedBox(height: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "Prod name",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "\$27",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WebsiteDetailsListModule extends StatelessWidget {
  WebsiteDetailsListModule({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: homeController.size.height * 0.24,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        image: DecorationImage(
          image: AssetImage(AppImages.detailsBgChocoImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "100% natural",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Fresh Chocolate",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            child: Text(
              "The customer is very important, the customer will be followed by the customer. In fact, neither mass nor protein is produced as a pot to drink. Maecenas and Leo do not have any homework. In fact, neither mass nor protein is produced as a pot to drink. Maecenas didn't even bother with homework.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: AppColors.whiteColor,
                height: 1.5,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
