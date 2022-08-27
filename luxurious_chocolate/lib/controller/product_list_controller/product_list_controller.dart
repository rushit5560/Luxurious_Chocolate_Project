import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:luxurious_chocolate/data/models/products_list_model/products_list_model.dart';

import '../../data/constants/api_urls.dart';
import '../../ui/widgets/helper_widgets/helper_toasts.dart';

class ProductListController extends GetxController {
  final categoryId = Get.arguments[0];
  final categoryName = Get.arguments[1];
  final size = Get.size;

  final GlobalKey<FormState> formKey = GlobalKey();
  final nameController = TextEditingController();

  RxBool isDataLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ProductsListModel? productsListModel;

  RxBool isGridView = true.obs;
  RxString selectedFilterValue = "Filter By".obs;

  List<String> filterItems = [
    'Filter By',
    'Sort By Name',
    'Sort By Date',
  ];

  getProductListByCategoryApi() async {
    try {
      isDataLoading(true);
      var url = ApiUrls.baseApiUrl + ApiUrls.productsListApiUrl;
      log("ProductListByCategory api url is : $url");
      log("category id is : $categoryId");

      http.Response response = await http.post(
        Uri.tryParse(url)!,
        body: {
          "id": "$categoryId",
        },
      );

      log("status code is : ${response.statusCode}");
      var result = jsonDecode(response.body);
      log("ProductListByCategory response body is : $result");

      productsListModel = ProductsListModel.fromJson(result);
      isSuccessStatus.value = productsListModel!.success;
      if (isSuccessStatus.value == true) {
        log("ProductListByCategory get Successfully...");
      } else {
        log("ProductListByCategory not else case...");
        HelperToasts().showTopToast(
          title: "ProductListByCategory Failed",
          message: "${result["error"]}",
        );
      }

      ///error

    } catch (e) {
      log('Error while api ProductListByCategory calling is $e');

      rethrow;
    } finally {
      isDataLoading(false);
    }
  }

  @override
  void onInit() {
    getProductListByCategoryApi();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
