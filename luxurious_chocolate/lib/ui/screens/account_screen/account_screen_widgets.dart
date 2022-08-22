import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/account_controller/account_controller.dart';

import '../../../data/constants/appcolors.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';

class MyAccountFormModule extends StatelessWidget {
  MyAccountFormModule({Key? key}) : super(key: key);
  final accountController = Get.find<AccountController>();
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
            key: accountController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  "My Account".tr,
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
                  "Name".tr,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  fieldController: accountController.emailController,
                  hintText: "Enter E-mail",
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
                  fieldController: accountController.emailController,
                  hintText: "Enter E-mail",
                  // validator: (value) => FieldValidator().validateEmail(value!)!,
                ),
                const SizedBox(height: 12),
                Text(
                  "Current Password".tr,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 10),
                CustomPassowrdTextField(
                  fieldController: accountController.emailController,
                  hintText: "Enter Current Password",
                  // validator: (value) => FieldValidator().validateEmail(value!)!,
                ),
                const SizedBox(height: 12),
                Text(
                  "New Password".tr,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),

                const SizedBox(height: 10),
                CustomPassowrdTextField(
                  fieldController: accountController.passwordController,
                  hintText: "Enter New Password",
                  // validator: (value) =>
                  //     FieldValidator().validatePassword(value!)!,
                ),

                const SizedBox(height: 30),
                SaveChangesButtonModule(),
                const SizedBox(height: 20),

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

  final accountController = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Save Changes",
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
        fixedSize: Size(accountController.size.width, 50),
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
