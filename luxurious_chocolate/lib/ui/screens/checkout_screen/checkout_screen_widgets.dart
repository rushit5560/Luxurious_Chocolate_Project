import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/controller/checkout_controller/checkout_controller.dart';

import 'package:luxurious_chocolate/routes/app_pages.dart';

import '../../../data/constants/appcolors.dart';
import '../../../data/constants/appimages.dart';
import '../../widgets/custom_textfield/custom_textfield.dart';

class BillingDetailsModule extends StatelessWidget {
  BillingDetailsModule({Key? key}) : super(key: key);
  final checkoutController = Get.find<CheckoutController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: checkoutController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Billing Details",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 5),
              Divider(
                thickness: 1,
                color: AppColors.accentGoldColor.withOpacity(0.6),
              ),
              const SizedBox(height: 15),

              //form fields

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name".tr,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          fieldController: checkoutController.emailController,
                          hintText: "Enter First Name",
                          // validator: (value) => FieldValidator().validateEmail(value!)!,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last Name".tr,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          fieldController: checkoutController.emailController,
                          hintText: "Enter Last Name",
                          // validator: (value) => FieldValidator().validateEmail(value!)!,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "Company Name (Optional)",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: checkoutController.emailController,
                hintText: "",
                // validator: (value) => FieldValidator().validateEmail(value!)!,
              ),
              const SizedBox(height: 12),
              Text(
                "Country",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: checkoutController.emailController,
                hintText: "Country",
                // validator: (value) => FieldValidator().validateEmail(value!)!,
              ),
              const SizedBox(height: 12),
              const Text(
                "Street Address",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: checkoutController.emailController,
                hintText: "Enter Street Address",
                // validator: (value) => FieldValidator().validateEmail(value!)!,
              ),
              const SizedBox(height: 12),
              const Text(
                "Town / City",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: checkoutController.emailController,
                hintText: "Enter City Name",
                // validator: (value) => FieldValidator().validateEmail(value!)!,
              ),
              const SizedBox(height: 12),
              const Text(
                "State",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: checkoutController.emailController,
                hintText: "Enter State Name",
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
                fieldController: checkoutController.emailController,
                hintText: "Enter Phone Number",
                // validator: (value) => FieldValidator().validateEmail(value!)!,
              ),
              const SizedBox(height: 12),
              const Text(
                "Email Address",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: checkoutController.emailController,
                hintText: "Enter Email Address",
                // validator: (value) => FieldValidator().validateEmail(value!)!,
              ),
              const SizedBox(height: 12),
              const Text(
                "Personalized Notes",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: checkoutController.emailController,
                hintText: "Notes",
                // validator: (value) => FieldValidator().validateEmail(value!)!,
              ),
              const SizedBox(height: 12),
              const Text(
                "Pdf",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                fieldController: checkoutController.emailController,
                hintText: "no file chosen",
                // validator: (value) => FieldValidator().validateEmail(value!)!,
              ),

              const SizedBox(height: 30),

              // const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderSummaryModule extends StatelessWidget {
  OrderSummaryModule({Key? key}) : super(key: key);
  final checkoutController = Get.find<CheckoutController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: AppColors.accentGoldColor,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          const SummaryTextRow(title: "Product", value: "price"),
          const SizedBox(height: 8),
          const Divider(color: AppColors.accentGoldColor),
          const SizedBox(height: 8),
          const SummaryTextRow(
              title: "Oreo Truffles box", value: "(\$185 X 1) 185"),
          const SizedBox(height: 8),
          const Divider(color: AppColors.accentGoldColor),
          const SizedBox(height: 8),
          const SummaryTextRow(title: "Sub Total", value: "\$185"),
          const SizedBox(height: 8),
          const Divider(color: AppColors.accentGoldColor),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Order Total: ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Text(
                  "\$ 185",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SummaryTextRow extends StatelessWidget {
  const SummaryTextRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentMethodModule extends StatefulWidget {
  PaymentMethodModule({Key? key}) : super(key: key);

  @override
  State<PaymentMethodModule> createState() => _PaymentMethodModuleState();
}

class _PaymentMethodModuleState extends State<PaymentMethodModule> {
  final checkoutController = Get.find<CheckoutController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: AppColors.accentGoldColor,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                value: 0,
                groupValue: checkoutController.paymentMode.value,
                fillColor: MaterialStateProperty.resolveWith(
                    (states) => AppColors.greenColor),
                onChanged: (value) {
                  checkoutController.paymentMode.value =
                      int.parse(value.toString());
                  setState(() {});
                },
              ),
              const Expanded(
                child: Text(
                  "Cash on delivery",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: checkoutController.paymentMode.value,
                fillColor: MaterialStateProperty.resolveWith(
                    (states) => AppColors.greenColor),
                onChanged: (value) {
                  checkoutController.paymentMode.value =
                      int.parse(value.toString());
                  setState(() {});
                },
              ),
              const Expanded(
                child: Text(
                  "Online",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
              ),
            ),
          ),
          const SizedBox(height: 30),
          PlaceOrderButtonModule(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class PlaceOrderButtonModule extends StatelessWidget {
  PlaceOrderButtonModule({Key? key}) : super(key: key);

  final checkoutController = Get.find<CheckoutController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Place Order",
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
        fixedSize: Size(checkoutController.size.width, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      onPressed: () {
        Get.toNamed(Routes.orderConfirmScreenRoute);
      },
    );
  }
}
