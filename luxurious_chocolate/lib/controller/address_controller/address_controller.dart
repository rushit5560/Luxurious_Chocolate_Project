import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

class AddressController extends GetxController {
  final size = Get.size;
  final GlobalKey<ScaffoldState> foldKey = GlobalKey();

  final GlobalKey<FormState> addressFormKey = GlobalKey();
  final GlobalKey<FormState> billingFormKey = GlobalKey();

  final aAddressController = TextEditingController();
  final aEmailController = TextEditingController();
  final aNumberController = TextEditingController();

  final bAddressController = TextEditingController();
  final bEmailController = TextEditingController();
  final bNumberController = TextEditingController();

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
}
