import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../data/constants/api_urls.dart';

class ContactUsController extends GetxController {
  final size = Get.size;

  final GlobalKey<FormState> formKey = GlobalKey();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final commentController = TextEditingController();

  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition kGooglePlex;
  Set<Marker> markers = {};

  RxBool isDataLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Marker shopMarker = const Marker(
    markerId: MarkerId('LuxuriousChocolate'),
    position: LatLng(53.544661073978794, -2.291403393024982),
    infoWindow: InfoWindow(title: 'Luxurious Chocolate'),
  );

  Future<void> disposeMapController() async {
    final GoogleMapController controller = await mapController.future;
    controller.dispose();
  }

  submitUserContactDetailsApi() async {
    if (formKey.currentState!.validate()) {
      try {
        isDataLoading(true);
        var url = ApiUrls.baseApiUrl + ApiUrls.contactUsApiUrl;
        log("User Contact us api url is : $url");
        log("name is : ${nameController.text}");
        log("email is : ${emailController.text}");
        log("subject is : ${subjectController.text}");
        log("comment is : ${commentController.text}");

        var body = {
          "name": nameController.text,
          "email": emailController.text,
          "subject": subjectController.text,
          "message": commentController.text,
        };

        http.Response response = await http.post(
          Uri.tryParse(url)!,
          body: body,
        );

        log("status code is : ${response.statusCode}");
        var result = jsonDecode(response.body);
        log("User Contact us response body is : $result");

        isSuccessStatus.value = result["success"];
        var apiMessage = result["message"];
        if (isSuccessStatus.value == true) {
          log("User Contact us update Successfully...");
          Get.back();
          Get.snackbar(
            "Success",
            apiMessage,
          );
          nameController.clear();
          emailController.clear();
          subjectController.clear();
          commentController.clear();
        } else {
          log("User Contact us not else case...");
          Get.snackbar(
            "Failed",
            "Submit Contact Details",
          );
        }
      } catch (e) {
        log('Error while api User Contact us calling is $e');

        rethrow;
      } finally {
        isDataLoading(false);
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    kGooglePlex = const CameraPosition(
        target: LatLng(53.544661073978794, -2.291403393024982),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    markers = {
      shopMarker,
    };

    log("kGooglePlex : $kGooglePlex");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disposeMapController();
    super.dispose();
  }
}
