import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

class ContactUsController extends GetxController {
  final size = Get.size;
  final GlobalKey<ScaffoldState> foldKey = GlobalKey();

  final GlobalKey<FormState> formKey = GlobalKey();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final commentController = TextEditingController();

  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition kGooglePlex;
  Set<Marker> markers = {};

  Marker shopMarker = const Marker(
    markerId: MarkerId('LuxuriousChocolate'),
    position: LatLng(53.544661073978794, -2.291403393024982),
    infoWindow: InfoWindow(title: 'Luxurious Chocolate'),
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    kGooglePlex = CameraPosition(
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

  Future<void> disposeMapController() async {
    final GoogleMapController controller = await mapController.future;
    controller.dispose();
  }
}
