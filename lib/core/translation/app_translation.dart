import 'package:sp2_ecoomerce/core/translation/languages/ar_language.dart';
import 'package:sp2_ecoomerce/core/translation/languages/en_language.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': ENLangauge.map,
        'ar_SA': ARLangauge.map,
      };
}

tr(String key) => key.tr;
