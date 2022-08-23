import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/models/banner_list_model/banner_list_model.dart';
import 'package:luxurious_chocolate/data/models/general_setting_model/general_setting_model.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import '../../data/constants/api_urls.dart';
import '../../ui/widgets/helper_widgets/helper_toasts.dart';

class HomeController extends GetxController {
  final size = Get.size;
  RxInt activeIndex = 0.obs;

  final GlobalKey<ScaffoldState> foldKey = GlobalKey();

  PageController carouselController = PageController();

  RxBool isDataLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  BannerListModel? bannerListModel;
  GeneralSettingModel? generalSettingModel;
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

  @override
  void onInit() {
    // TODO: implement onInit
    getBannerList();
    getGeneralSettingApi();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  navigateToHomeScreen() {
    Get.off(Routes.homeScreenRoute);
  }

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  //changeLanguageAlertDialog Start
  changeLanguageAlertDialog(BuildContext context) {
// set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );
// set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        'Choose Your Language',
        style: TextStyle(
          color: AppColors.accentGoldColor,
        ),
      ),
      content: SizedBox(
          width: double.maxFinite,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Text(
                      locale[index]['name'],
                      style: TextStyle(
                        color: AppColors.blackColor.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    onTap: () {
// print(locale[index]['name']);
                      updateLanguage(locale[index]['locale']);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.accentGoldColor,
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

  getBannerList() async {
    try {
      isDataLoading(true);
      var url = ApiUrls.baseApiUrl + ApiUrls.bannerApiUrl;
      log("banner api url is : $url");

      http.Response response = await http.post(
        Uri.tryParse(url)!,
      );

      log("status code is : ${response.statusCode}");
      var result = jsonDecode(response.body);
      log("banner response body is : $result");

      if (response.body.contains("banner Successfully")) {
        ///data successfully

        log("banner response body is : $result");

        bannerListModel = BannerListModel.fromJson(result);
        isSuccessStatus.value = bannerListModel!.success;
        if (isSuccessStatus.value == true) {
          log("bannerListModel get Successfully...");
        } else {
          log("Not bannerListModel  else case...");
        }
      } else {
        ///error

        log("Not bannerListModel In...");
        HelperToasts().showTopToast(
          title: "banner Failed",
          message: "${result["error"]}",
        );
      }
    } catch (e) {
      log('Error while api bannerListModel calling is $e');
      print('Error while bannerListModel api calling is $e');
      rethrow;
    } finally {
      isDataLoading(false);
    }
  }

  getGeneralSettingApi() async {
    try {
      isDataLoading(true);
      var url = ApiUrls.baseApiUrl + ApiUrls.generalsettingApiUrl;
      log("generalsetting api url is : $url");

      http.Response response = await http.post(
        Uri.tryParse(url)!,
      );

      log("status code is : ${response.statusCode}");
      var result = jsonDecode(response.body);
      log("generalsetting response body is : $result");

      if (response.body.contains("banner Successfully")) {
        ///data successfully

        log("generalsetting response body is : $result");

        generalSettingModel = GeneralSettingModel.fromJson(result);
        isSuccessStatus.value = generalSettingModel!.success;
        if (isSuccessStatus.value == true) {
          log("generalsetting get Successfully...");
        } else {
          log("Not generalsetting  else case...");
        }
      } else {
        ///error

        log("Not generalsetting In...");
        HelperToasts().showTopToast(
          title: "generalsetting Failed",
          message: "${result["error"]}",
        );
      }
    } catch (e) {
      log('Error while api generalsetting calling is $e');

      rethrow;
    } finally {
      isDataLoading(false);
    }
  }
}
