import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/register_controller/register_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../widgets/custom_textfield/custom_textfield.dart';

class RegistrationFormModule extends StatelessWidget {
  RegistrationFormModule({Key? key}) : super(key: key);

  final registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: registerController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.appLogo),
              const SizedBox(height: 25),
              const Text(
                "Registration",
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
                "  Full Name",
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
              ),

              const SizedBox(height: 12),
              const Text(
                "  Email",
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
              ),
              const SizedBox(height: 12),
              const Text(
                "  Password",
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
              ),
              const SizedBox(height: 12),
              const Text(
                "  Confirm Password",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomPassowrdTextField(
                fieldController: registerController.confirmPasswordController,
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

class AcceptTermsAndConditionsCheckBox extends StatelessWidget {
  AcceptTermsAndConditionsCheckBox({
    Key? key,
  }) : super(key: key);

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
            },
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "Accept Terms & Conditions",
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

class ReceiveEmailAndOfferCheckBox extends StatelessWidget {
  ReceiveEmailAndOfferCheckBox({
    Key? key,
  }) : super(key: key);

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
            },
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "Yes, I'd Love To Receive Emails For Offers",
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
    return OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Sign Up",
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
        fixedSize: Size(registerController.size.width, 50),
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
