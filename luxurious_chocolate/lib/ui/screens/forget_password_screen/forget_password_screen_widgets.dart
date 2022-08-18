import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/forget_password_controller/forget_password_controller.dart';

import '../../../data/constants/appcolors.dart';
import '../../../data/constants/appimages.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';

class EmailFormModule extends StatelessWidget {
  EmailFormModule({Key? key}) : super(key: key);
  final loginController = Get.find<ForgetPasswordController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: loginController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.appLogo),
              const SizedBox(height: 35),
              const Text(
                "Forgot password",
                style: TextStyle(
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

              //form fields
              const Text(
                "No worried! Enter your email and we will send a reset.",
                style: TextStyle(
                  color: AppColors.accentGoldColor,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 25),
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
                fieldController: loginController.emailController,
                hintText: "E-mail",
                // validator: (value) => FieldValidator().validateEmail(value!)!,
              ),

              const SizedBox(height: 40),
              SignInButtonModule(),
              const SizedBox(height: 25),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInButtonModule extends StatelessWidget {
  SignInButtonModule({Key? key}) : super(key: key);

  final loginController = Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Send ",
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
        fixedSize: Size(loginController.size.width, 50),
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
