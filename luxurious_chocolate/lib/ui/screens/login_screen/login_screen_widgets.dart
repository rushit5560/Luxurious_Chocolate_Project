import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/login_controller/login_controller.dart';
import 'package:luxurious_chocolate/data/field_validation.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../data/constants/appcolors.dart';
import '../../../data/constants/appimages.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';
import '../../widgets/helper_widgets/helper_toasts.dart';

class LoginFormModule extends StatelessWidget {
  LoginFormModule({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: loginController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.appLogo),
              const SizedBox(height: 35),
              Text(
                "Log In".tr,
                style: const TextStyle(
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
                "Email".tr,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: loginController.emailController,
                hintText: "Enter E-mail",
                textInputAction: TextInputAction.next,
                validator: (value) => FieldValidator().validateEmail(value!),
              ),
              const SizedBox(height: 12),
              Text(
                "Password".tr,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),

              const SizedBox(height: 10),
              CustomPassowrdTextField(
                fieldController: loginController.passwordController,
                hintText: "Enter Password",
                textInputAction: TextInputAction.done,
                validator: (value) => FieldValidator().validatePassword(value!),
              ),
              const SizedBox(height: 20),

              //terms & checks
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.forgetPasswordScreenRoute);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Text(
                    "Forgot Password".tr,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greenColor,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              SignInButtonModule(),
              const SizedBox(height: 25),
              SignUpTextModule(),
              const SizedBox(height: 30),

              // const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInButtonModule extends StatelessWidget {
  SignInButtonModule({Key? key}) : super(key: key);

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Center(
        child: loginController.isDataLoading.value
            ? HelperToasts().showCircularWhiteLoader()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log In".tr,
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
        fixedSize: Size(loginController.size.width, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      onPressed: () {
        loginController.submitLoginForm();
      },
    );
  }
}

class SignUpTextModule extends StatelessWidget {
  SignUpTextModule({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();
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
