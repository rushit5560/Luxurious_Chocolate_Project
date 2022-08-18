import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  String productName = Get.arguments[0];
  final size = Get.size;
  final GlobalKey<ScaffoldState> foldKey = GlobalKey();

  final GlobalKey<FormState> formKey = GlobalKey();

  final quantityController = TextEditingController();
  final emailController = TextEditingController();

  RxInt selectedQuantityValue = 1.obs;

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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
