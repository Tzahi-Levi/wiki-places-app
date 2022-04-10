// ================= Resources =================
import 'package:get/get.dart';
import 'package:wiki_places/localization/resources/resources_en.dart';
import 'package:wiki_places/localization/resources/resources_he.dart';

class Resources extends Translations {
  static final Resources _instance = Resources._();
  static Resources get instance => _instance;
  Resources._();

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': resourcesEn,
    'he_IL': resourcesHe,
  };
}
