import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/models/login_model/login_model.dart';
import 'package:luxurious_chocolate/data/sharedpreference_data/sharedpreference_data.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import '../../data/constants/api_urls.dart';
import '../../ui/widgets/helper_widgets/helper_toasts.dart';

class LoginController extends GetxController {
  final size = Get.size;
  final GlobalKey<ScaffoldState> foldKey = GlobalKey();

  final GlobalKey<FormState> formKey = GlobalKey();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isDataLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  navigateToHomeScreen() {
    Get.offAllNamed(Routes.homeScreenRoute);
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

  loginUser() async {
    try {
      isDataLoading(true);
      var url = ApiUrls.baseApiUrl + ApiUrls.loginApiUrl;
      log("login api url is : $url");

      var body = {
        "email": emailController.text,
        "password": passwordController.text,
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
      log("login response body is : $result");

      if (response.body.contains("login Successfully")) {
        ///data successfully

        log("login response body is : $result");

        LoginModel loginModel = LoginModel.fromJson(result);
        isSuccessStatus.value = loginModel.success;
        if (isSuccessStatus.value == true) {
          log("User Logged In Successfully...");
          HelperToasts().showTopToast(
            title: loginModel.data.email,
            message: loginModel.messege,
          );

          SharedPreferenceData().setUserLoginDetailsInPrefs(
            userId: loginModel.data.id.toString(),
            userName: loginModel.data.name,
            email: loginModel.data.email,
            userImage: loginModel.data.image ?? "",
            createdAt: loginModel.data.createdAt.toIso8601String(),
            updatedAt: loginModel.data.updatedAt.toIso8601String(),
          );
          navigateToHomeScreen();
        } else {
          log("Not logged In else case...");
          HelperToasts().showTopToast(
            title: "Error occured while login",
            message: "${result["error"]["email"][0]}",
          );
        }
      } else {
        ///error

        log("Not logged In...");
        HelperToasts().showTopToast(
          title: "Login Failed",
          message: "${result["error"]}",
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

  submitLoginForm() async {
    if (formKey.currentState!.validate()) {
      await loginUser();
      // if (termsAndConditionsCheckBoxBool.value) {
      // } else {
      //   HelperToasts().showTopToast(
      //     title: "Required Field",
      //     message: "Please Accept terms & conditions field",
      //   );
      // }
    } else {
      //null
    }
  }
}
