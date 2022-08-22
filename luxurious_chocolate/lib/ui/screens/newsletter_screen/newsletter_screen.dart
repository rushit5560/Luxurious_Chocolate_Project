import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/data/constants/appcolors.dart';
import 'package:luxurious_chocolate/ui/screens/newsletter_screen/newsletter_screen_widgets.dart';

import 'package:luxurious_chocolate/ui/widgets/custom_appbar/custom_appbar.dart';

import '../../../controller/newsletter_controller/newsletter_controller.dart';

class NewsletterScreen extends GetView<NewsletterController> {
  const NewsletterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar("Newsletters".tr),
      body: SafeArea(
        child: NewsletterFormModule(),
      ),
    );
  }
}
