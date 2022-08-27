import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/register_controller/register_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../data/field_validation.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';
import '../../widgets/helper_widgets/helper_toasts.dart';

class RegistrationFormModule extends StatelessWidget {
  RegistrationFormModule({Key? key}) : super(key: key);

  final registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: registerController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.appLogo),
              const SizedBox(height: 25),
              Text(
                "Registration".tr,
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
              const Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: registerController.fullNameController,
                hintText: "Enter Name",
                textInputAction: TextInputAction.next,
                validator: (value) => FieldValidator().validateFullName(value!),
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
                fieldController: registerController.emailController,
                hintText: "Enter E-mail",
                textInputAction: TextInputAction.next,
                validator: (value) => FieldValidator().validateEmail(value!),
              ),
              const SizedBox(height: 12),
              Text(
                "Password".tr,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),

              const SizedBox(height: 10),
              CustomPassowrdTextField(
                fieldController: registerController.passwordController,
                hintText: "Enter Password",
                textInputAction: TextInputAction.next,
                validator: (value) => FieldValidator().validateConfirmPassword(
                  value!,
                  registerController.passwordController.text,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Confirm Password".tr,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomPassowrdTextField(
                fieldController: registerController.confirmPasswordController,
                textInputAction: TextInputAction.done,
                hintText: "Enter Confirm Password",
              ),
              const SizedBox(height: 12),

              //terms & checks
              AcceptTermsAndConditionsCheckBox(),
              ReceiveEmailAndOfferCheckBox(),

              const SizedBox(height: 20),
              SignUpButtonModule(),
              const SizedBox(height: 25),
              SignInTextModule(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class AcceptTermsAndConditionsCheckBox extends StatefulWidget {
  AcceptTermsAndConditionsCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<AcceptTermsAndConditionsCheckBox> createState() =>
      _AcceptTermsAndConditionsCheckBoxState();
}

class _AcceptTermsAndConditionsCheckBoxState
    extends State<AcceptTermsAndConditionsCheckBox> {
  final registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            checkColor: AppColors.whiteColor,
            fillColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.accentGoldColor),
            value: registerController.termsAndConditionsCheckBoxBool.value,
            onChanged: (value) {
              registerController.termsAndConditionsCheckBoxBool.value = value!;
              setState(() {});
              log("terms & condi check : ${registerController.termsAndConditionsCheckBoxBool.value}");
            },
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Accept Terms & Condtions".tr,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}

class ReceiveEmailAndOfferCheckBox extends StatefulWidget {
  ReceiveEmailAndOfferCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<ReceiveEmailAndOfferCheckBox> createState() =>
      _ReceiveEmailAndOfferCheckBoxState();
}

class _ReceiveEmailAndOfferCheckBoxState
    extends State<ReceiveEmailAndOfferCheckBox> {
  final registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            checkColor: AppColors.whiteColor,
            fillColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.accentGoldColor),
            value: registerController.emailAndOffersCheckBoxBool.value,
            onChanged: (value) {
              registerController.emailAndOffersCheckBoxBool.value = value!;

              setState(() {});

              log("receive emails check : ${registerController.emailAndOffersCheckBoxBool.value}");
            },
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Yes, I’d love to receive emails for offers.".tr,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}

class SignUpButtonModule extends StatelessWidget {
  SignUpButtonModule({Key? key}) : super(key: key);
  final registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Center(
        child: registerController.isDataLoading.value
            ? HelperToasts().showCircularWhiteLoader()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up".tr,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColors.greenColor,
        fixedSize: Size(registerController.size.width, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      onPressed: () {
        registerController.submitRegisterForm();
      },
    );
  }
}

class SignInTextModule extends StatelessWidget {
  SignInTextModule({Key? key}) : super(key: key);
  final registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "I have an account? -",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.loginScreenRoute);
          },
          child: const Text(
            " Sign In Now",
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
