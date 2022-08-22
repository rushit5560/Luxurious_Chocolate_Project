import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luxurious_chocolate/controller/contact_us_controller/contact_us_controller.dart';

import '../../../data/constants/appcolors.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';

class GetInTouchModule extends StatelessWidget {
  GetInTouchModule({Key? key}) : super(key: key);
  final contactController = Get.find<ContactUsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: AppColors.accentGoldColor,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            "Get In Touch".tr,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 5),
          Divider(
            thickness: 1,
            color: AppColors.accentGoldColor.withOpacity(0.6),
          ),
          const SizedBox(height: 15),
          ContactInfoRowMoule(
            iconData: Icons.house_rounded,
            titleText: "Address".tr,
            descText: "7000, WhiteField, Manchester Highway, London. 401203",
          ),
          const SizedBox(height: 15),
          ContactInfoRowMoule(
            iconData: Icons.email_rounded,
            titleText: "Email".tr + " / " + "Fax".tr,
            descText: "info@LuxuriousChocolate.com",
          ),
          const SizedBox(height: 15),
          ContactInfoRowMoule(
            iconData: Icons.house_rounded,
            titleText: "Phone".tr,
            descText: "971000000000",
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class ContactInfoRowMoule extends StatelessWidget {
  const ContactInfoRowMoule({
    Key? key,
    required this.iconData,
    required this.titleText,
    required this.descText,
  }) : super(key: key);

  final IconData iconData;
  final String titleText;
  final String descText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 30,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleText,
                style: const TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                descText,
                style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContactUsModule extends StatelessWidget {
  ContactUsModule({Key? key}) : super(key: key);

  final contactController = Get.find<ContactUsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),

          Text(
            "Contact Us".tr,
            style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 5),
          Divider(
            thickness: 1,
            color: AppColors.accentGoldColor.withOpacity(0.6),
          ),
          const SizedBox(height: 15),

          //form fields
          Text(
            "Name".tr,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            fieldController: contactController.nameController,
            hintText: "Your Name",
            // validator: (value) => FieldValidator().validateEmail(value!)!,
          ),
          const SizedBox(height: 12),
          Text(
            "Email".tr,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            fieldController: contactController.emailController,
            hintText: "E-mail",
            // validator: (value) => FieldValidator().validateEmail(value!)!,
          ),
          const SizedBox(height: 12),
          Text(
            "Phone Number".tr,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            fieldController: contactController.phoneController,
            hintText: "Your Phone",
            // validator: (value) => FieldValidator().validateEmail(value!)!,
          ),
          const SizedBox(height: 12),
          Text(
            "Subject".tr,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            fieldController: contactController.subjectController,
            hintText: "Subject",
            // validator: (value) => FieldValidator().validateEmail(value!)!,
          ),
          const SizedBox(height: 12),
          Text(
            "Comment".tr,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),

          const SizedBox(height: 10),
          CustomTextField(
            fieldController: contactController.commentController,
            hintText: "Your Message",
            // validator: (value) =>
            //     FieldValidator().validatePassword(value!)!,
          ),

          //terms & checks

          const SizedBox(height: 30),

          // const SizedBox(height: 25),
          SubmitButtonModule(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);

  final contactController = Get.find<ContactUsController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Submit",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.whiteColor,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColors.greenColor,
        fixedSize: Size(contactController.size.width, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}

class MapShowModule extends StatelessWidget {
  MapShowModule({Key? key}) : super(key: key);
  final contactController = Get.find<ContactUsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: contactController.size.height * 0.35,
          margin: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: contactController.kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                contactController.mapController.complete(controller);
              },
              myLocationEnabled: false,
              compassEnabled: true,
              markers: contactController.markers,
              myLocationButtonEnabled: false,
              onTap: (latLong) {
                log("latLong : $latLong");
                // contactController.selectedLatitude.value =
                //     latLong.latitude.toString();
                // contactController.selectedLongitude.value =
                //     latLong.longitude.toString();

                // contactController.markers.clear();
                // contactController.markers.add(
                //   Marker(
                //     markerId: const MarkerId("selectedLocation"),
                //     position: LatLng(
                //       double.parse(contactController.selectedLatitude.value),
                //       double.parse(contactController.selectedLongitude.value),
                //     ),
                //   ),
                // );

                // contactController.loadUI();
              },
              scrollGesturesEnabled: true,
              rotateGesturesEnabled: false,
              buildingsEnabled: false,
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
            ),
          ),
        ),
        const SizedBox(height: 15),
        // Row(
        //   children: [
        //     const Expanded(
        //       flex: 4,
        //       child: Text(
        //         "Latitude :",
        //         textAlign: TextAlign.end,
        //       ),
        //     ),
        //     const SizedBox(width: 15),
        //     Expanded(
        //       flex: 6,
        //       child: Text(contactController.selectedLatitude.value),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 5),
        // Row(
        //   children: [
        //     const Expanded(
        //       flex: 4,
        //       child: Text(
        //         "Longitude :",
        //         textAlign: TextAlign.end,
        //       ),
        //     ),
        //     const SizedBox(width: 15),
        //     Expanded(
        //       flex: 6,
        //       child: Text(contactController.selectedLongitude.value),
        //     ),
        //   ],
        // ),
        const SizedBox(height: 15),
      ],
    );
  }
}
