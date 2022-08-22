import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/login_controller/login_controller.dart';
import 'package:luxurious_chocolate/controller/newsletter_controller/newsletter_controller.dart';
import 'package:luxurious_chocolate/data/field_validation.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../controller/wishlist_controller/wishlist_controller.dart';
import '../../../data/constants/appcolors.dart';
import '../../../data/constants/appimages.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';

class NewsletterFormModule extends StatelessWidget {
  NewsletterFormModule({Key? key}) : super(key: key);
  final newsletterController = Get.find<NewsletterController>();
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
            key: newsletterController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                const Text(
                  "Subscribe for Newsletters",
                  style: TextStyle(
                    color: AppColors.accentGoldColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 5),
                Divider(
                  thickness: 1,
                  color: AppColors.accentGoldColor.withOpacity(0.6),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Alteration in some form injected humor words which don\'t even slightly believable."
                        .tr,
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                //form fields

                CustomTextField(
                  fieldController: newsletterController.emailController,
                  hintText: "Enter E-mail",
                  // validator: (value) => FieldValidator().validateEmail(value!)!,
                ),
                const SizedBox(height: 20),

                SendButtonModule(),
                const SizedBox(height: 10),

                // const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SendButtonModule extends StatelessWidget {
  SendButtonModule({Key? key}) : super(key: key);

  final newsletterController = Get.find<NewsletterController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "send".tr,
                  style: TextStyle(
                    fontSize: 18,
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
              fixedSize: Size(newsletterController.size.width, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
