import 'package:get/get.dart';
import 'package:luxurious_chocolate/translations/aed_AED/aed_AED_translations.dart';

import 'en_US/en_us_translations.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'aed_AED': aedAed,
      };
}
