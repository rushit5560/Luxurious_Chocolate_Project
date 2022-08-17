import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/register_controller/register_controller.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/data/constants/appimages.dart';

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

              const SizedBox(height: 12),
              SignInButtonModule(),
              const SizedBox(height: 12),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.fieldController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      borderSide: BorderSide(
        color: AppColors.accentGoldColor.withOpacity(0.5),
        width: 1,
      ),
    );
    var errBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      borderSide: BorderSide(
        color: AppColors.redColor.withOpacity(0.5),
        width: 1,
      ),
    );
    return TextFormField(
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: fieldController,
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        errorBorder: errBorder,
        focusedBorder: border,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      ),
    );
  }
}

class CustomPassowrdTextField extends StatefulWidget {
  const CustomPassowrdTextField({
    Key? key,
    required this.fieldController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String hintText;

  @override
  State<CustomPassowrdTextField> createState() =>
      _CustomPassowrdTextFieldState();
}

class _CustomPassowrdTextFieldState extends State<CustomPassowrdTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      borderSide: BorderSide(
        color: AppColors.accentGoldColor.withOpacity(0.5),
        width: 1,
      ),
    );
    var errBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      borderSide: BorderSide(
        color: AppColors.redColor.withOpacity(0.5),
        width: 1,
      ),
    );
    return TextFormField(
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.fieldController,
      obscureText: isObscure,
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        errorBorder: errBorder,
        focusedBorder: border,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.accentGoldColor,
          ),
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
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

class SignInButtonModule extends StatelessWidget {
  SignInButtonModule({Key? key}) : super(key: key);
  final registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Sign In",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward_rounded),
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
