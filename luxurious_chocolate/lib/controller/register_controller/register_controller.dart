import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/api_urls.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/models/register_model/register_model.dart';
import 'package:luxurious_chocolate/data/sharedpreference_data/sharedpreference_data.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:luxurious_chocolate/ui/widgets/helper_widgets/helper_toasts.dart';

class RegisterController extends GetxController {
  final size = Get.size;
  final GlobalKey<ScaffoldState> foldKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool termsAndConditionsCheckBoxBool = false.obs;
  RxBool emailAndOffersCheckBoxBool = false.obs;

  RxBool isDataLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  navigateToHomeScreen() {
    Get.off(Routes.homeScreenRoute);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  registerUser() async {
    try {
      isDataLoading(true);
      var url = ApiUrls.baseApiUrl + ApiUrls.registerApiUrl;

      var body = {
        "name": fullNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "c_password": confirmPasswordController.text,
      };
      http.Response response = await http.post(
        Uri.tryParse(url)!,
        body: body,
        // headers: {
        //   'app-id': '6218809df11d1d412af5bac4',
        // },
      );

      log("status code is : ${response.statusCode}");
      var result = jsonDecode(response.body);
      log("register response body is : $result");

      if (response.body.contains("register Successfully")) {
        ///data successfully

        log("register response body is : $result");

        RegisterModel registerModel = RegisterModel.fromJson(result);
        isSuccessStatus.value = registerModel.success;
        if (isSuccessStatus.value == true) {
          log("User Registered In...");
          HelperToasts().showTopToast(
            title: registerModel.data.email,
            message: registerModel.message,
          );
          Get.offNamed(Routes.loginScreenRoute);
        } else {
          log("Not Registered In...");
          HelperToasts().showTopToast(
            title: "Error Occured",
            message: "${result["error"]["email"][0]}",
          );
        }
      } else {
        ///error

        log("Not Registered In...");
        HelperToasts().showTopToast(
          title: "Error Occured",
          message: "${result["error"]["email"][0]}",
        );
      }
    } catch (e) {
      log('Error while api calling is $e');
      print('Error while  api calling is $e');
      rethrow;
    } finally {
      isDataLoading(false);
    }
  }

  submitRegisterForm() async {
    if (formKey.currentState!.validate()) {
      if (termsAndConditionsCheckBoxBool.value) {
        await registerUser();
      } else {
        HelperToasts().showTopToast(
          title: "Required Field",
          message: "Please Accept terms & conditions field",
        );
      }
    } else {
      //null
    }
  }
}
