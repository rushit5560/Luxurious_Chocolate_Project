import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxurious_chocolate/routes/app_pages.dart';
import 'package:luxurious_chocolate/translations/app_translations.dart';

void main() {
  // WidgetsBinding.instance.;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      // translations: Messages(), // your translations
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.fade,

      getPages: AppPages.pages,
      locale: const Locale('en', 'US'),
      translationsKeys: AppTranslation.translations,
    );
  }
}
