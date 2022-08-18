import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

class CartViewController extends GetxController {
  final size = Get.size;
  final GlobalKey<ScaffoldState> foldKey = GlobalKey();

  RxBool isLoading = false.obs;

  RxInt qtyValue = 1.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
