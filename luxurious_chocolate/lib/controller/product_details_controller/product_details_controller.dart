import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:luxurious_chocolate/data/models/product_details_model/product_details_model.dart';
import '../../data/constants/api_urls.dart';
import '../../ui/widgets/helper_widgets/helper_toasts.dart';

class ProductDetailsController extends GetxController {
  int productId = Get.arguments[0];
  String productName = Get.arguments[1];
  final size = Get.size;

  final GlobalKey<FormState> formKey = GlobalKey();

  final quantityController = TextEditingController();
  final emailController = TextEditingController();
  RxBool isProdInStock = false.obs;

  RxInt selectedQuantityValue = 1.obs;

  RxBool isDataLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ProductDetailsModel? productDetailsModel;

  RxString selectedChocoColorValue = "Dark".obs;
  List<String> colorItems = [
    'Dark',
    'White',
    'Black',
    'Brown',
    'Blue',
  ];

  RxString selectedChocoFillingValue = "Latte".obs;
  List<String> fillingItems = [
    'Filling',
    'Choco',
    'Latte',
  ];

  getProductDetailsApi() async {
    try {
      isDataLoading(true);
      var url = ApiUrls.baseApiUrl + ApiUrls.productsDetailsApiUrl;
      log("productDetailsModel api url is : $url");

      http.Response response = await http.post(
        Uri.tryParse(url)!,
        body: {
          "id": "$productId",
        },
      );

      log("status code is : ${response.statusCode}");
      var result = jsonDecode(response.body);
      log("productDetailsModel response body is : $result");

      productDetailsModel = ProductDetailsModel.fromJson(result);
      isSuccessStatus.value = productDetailsModel!.success;
      if (isSuccessStatus.value == true) {
        log("productDetailsModel get Successfully...");
      } else {
        log("productDetailsModel not else case...");
        HelperToasts().showTopToast(
          title: "productDetailsModel Failed",
          message: "${result["error"]}",
        );
      }
    } catch (e) {
      log('Error while api productDetailsModel calling is $e');

      rethrow;
    } finally {
      isDataLoading(false);
    }
  }


  addProductToWishlistApi() async {
    try {
      isDataLoading(true);
      var url = ApiUrls.baseApiUrl + ApiUrls.productsDetailsApiUrl;
      log("productDetailsModel api url is : $url");

      http.Response response = await http.post(
        Uri.tryParse(url)!,
        body: {
          "id": "$productId",
        },
      );

      log("status code is : ${response.statusCode}");
      var result = jsonDecode(response.body);
      log("productDetailsModel response body is : $result");

      productDetailsModel = ProductDetailsModel.fromJson(result);
      isSuccessStatus.value = productDetailsModel!.success;
      if (isSuccessStatus.value == true) {
        log("productDetailsModel get Successfully...");
      } else {
        log("productDetailsModel not else case...");
        HelperToasts().showTopToast(
          title: "productDetailsModel Failed",
          message: "${result["error"]}",
        );
      }
    } catch (e) {
      log('Error while api productDetailsModel calling is $e');

      rethrow;
    } finally {
      isDataLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    getProductDetailsApi();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
