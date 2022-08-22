import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

class HomeController extends GetxController {
  final size = Get.size;
  RxInt activeIndex = 0.obs;

  final GlobalKey<ScaffoldState> foldKey = GlobalKey();

  PageController carouselController = PageController();

  final List locale = [
    {
      'name': 'ENGLISH',
      'locale': const Locale('en', 'US'),
    },
    {
      'name': 'ARABIC',
      'locale': const Locale('aed', 'AED'),
    },
  ];

  List<String> bannerImages = [
    "assets/images/banner1.png",
    "assets/images/banner1.png",
    "assets/images/banner1.png",
  ];

  List<Widget>? images = [
    Image.asset(
      "assets/images/banner1.png",
      height: 250,
      width: double.infinity,
      fit: BoxFit.cover,
    )
  ];

  List<String> categoryList = [
    "ChocoBox",
    "WhiteBox",
    "CompaignBox",
    "WhiteChoco",
    "RichChocolate",
  ];

  navigateToHomeScreen() {
    Get.off(Routes.homeScreenRoute);
  }

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  //ChangeLanguageAlertDialog Start
  ChangeLanguageAlertDialog(BuildContext context) {
// set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );
// set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text('Choose Your Language'),
      content: Container(
          width: double.maxFinite,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Text(locale[index]['name']),
                    onTap: () {
// print(locale[index]['name']);
                      updateLanguage(locale[index]['locale']);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length)),
    );
// show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
//ChangeLanguageAlertDialog End

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // bannerImages = [
    // AppImages.appLogo,
    // AppImages.appLogo,
    // AppImages.appLogo,
    // ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
