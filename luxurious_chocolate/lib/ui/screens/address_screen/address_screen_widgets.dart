import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../controller/address_controller/address_controller.dart';
import '../../../data/constants/appcolors.dart';
import '../../../data/constants/appimages.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';

class AddressFormModule extends StatelessWidget {
  AddressFormModule({Key? key}) : super(key: key);
  final addressController = Get.find<AddressController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              color: AppColors.accentGoldColor,
              width: 1,
            ),
          ),
          child: Form(
            key: addressController.addressFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  "My Address".tr,
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
                  "Address".tr,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  fieldController: addressController.aAddressController,
                  hintText: "Enter Address",
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
                  fieldController: addressController.aEmailController,
                  hintText: "Enter Mobile Number",
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
                  fieldController: addressController.aEmailController,
                  hintText: "Enter Email",
                  // validator: (value) => FieldValidator().validateEmail(value!)!,
                ),

                const SizedBox(height: 20),
                SaveChangesButtonModule(),
                const SizedBox(height: 15),

                // const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SaveChangesButtonModule extends StatelessWidget {
  SaveChangesButtonModule({Key? key}) : super(key: key);

  final addressController = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Save Changes".tr,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          // SizedBox(width: 10),
          // Icon(
          //   Icons.arrow_forward_rounded,
          //   color: AppColors.whiteColor,
          // ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColors.greenColor,
        fixedSize: Size(addressController.size.width, 50),
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

class BillingFormModule extends StatelessWidget {
  BillingFormModule({Key? key}) : super(key: key);

  final addressController = Get.find<AddressController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              color: AppColors.accentGoldColor,
              width: 1,
            ),
          ),
          child: Form(
            key: addressController.billingFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  "My Billing".tr,
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
                  "Address".tr,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  fieldController: addressController.bAddressController,
                  hintText: "Enter Address",
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
                  fieldController: addressController.bNumberController,
                  hintText: "Enter Mobile Number",
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
                  fieldController: addressController.bEmailController,
                  hintText: "Enter Email",
                  // validator: (value) => FieldValidator().validateEmail(value!)!,
                ),

                const SizedBox(height: 20),
                SaveChangesButtonModule(),
                const SizedBox(height: 15),

                // const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInButtonModule extends StatelessWidget {
  SignInButtonModule({Key? key}) : super(key: key);

  final addressController = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Log In",
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
        fixedSize: Size(addressController.size.width, 50),
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

class SignUpTextModule extends StatelessWidget {
  SignUpTextModule({Key? key}) : super(key: key);
  final addressController = Get.find<AddressController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "I don't have an account? -",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Text(
            " Sign Up Now",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.greenColor,
            ),
          ),
        ),
      ],
    );
  }
}
