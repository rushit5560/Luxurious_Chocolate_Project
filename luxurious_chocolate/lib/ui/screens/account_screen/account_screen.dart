import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';

import '../../../controller/account_controller/account_controller.dart';
import 'account_screen_widgets.dart';

class AccountScreen extends GetView<AccountController> {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar("My Account".tr),
      body: SafeArea(
        child: MyAccountFormModule(),
      ),
    );
  }
}
