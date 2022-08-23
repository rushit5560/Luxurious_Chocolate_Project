import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/constants/user_details.dart';
import '../../data/sharedpreference_data/sharedpreference_data.dart';

class SplashController extends GetxController {
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();
  final size = Get.size;

  navigateToHomeScreen() {
    Get.off(Routes.homeScreenRoute);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLoginUserDetails();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  getLoginUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDetails.isUserLoggedIn =
        prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    UserDetails.userId = prefs.getString(sharedPreferenceData.userIdKey) ?? "";
    UserDetails.userName =
        prefs.getString(sharedPreferenceData.userNameKey) ?? "";
    UserDetails.userimage =
        prefs.getString(sharedPreferenceData.userImagekey) ?? "";
    UserDetails.createdAt =
        prefs.getString(sharedPreferenceData.createdAtKey) ?? "";
    UserDetails.updatedAt =
        prefs.getString(sharedPreferenceData.updatedAtKey) ?? "";

    log("UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}");
    log("UserDetails.userId : ${UserDetails.userId}");
    log("UserDetails.userName : ${UserDetails.userName}");
    log("UserDetails.userimage : ${UserDetails.userimage}");
    log("UserDetails.createdAt : ${UserDetails.createdAt}");
    log("UserDetails.updatedAt : ${UserDetails.updatedAt}");
  }
}
