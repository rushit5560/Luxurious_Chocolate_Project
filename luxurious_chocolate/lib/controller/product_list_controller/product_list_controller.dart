import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

class ProductListController extends GetxController {
  final categoryName = Get.arguments[0];
  final size = Get.size;
  final GlobalKey<ScaffoldState> foldKey = GlobalKey();

  final GlobalKey<FormState> formKey = GlobalKey();

  final nameController = TextEditingController();

  RxBool isGridView = true.obs;

  RxString selectedFilterValue = "Filter By".obs;

  List<String> filterItems = [
    'Filter By',
    'Sort By Name',
    'Sort By Date',
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
