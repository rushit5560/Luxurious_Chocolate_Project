import 'package:flutter/material.dart';

import '../../../data/constants/appcolors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.fieldController,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String hintText;
  final String Function(String?)? validator;

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
      // autofocus: true,
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
    this.validator,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String hintText;
  final String Function(String?)? validator;

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
      // autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.fieldController,
      obscureText: isObscure,
      validator: widget.validator,
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
