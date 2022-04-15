// ================= Google Analytics Wrapper =================
import 'package:get/get.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class GoogleAnalytics {
  static final GoogleAnalytics _instance = GoogleAnalytics._();
  static GoogleAnalytics get instance => _instance;
  GoogleAnalytics._();

  static final FirebaseAnalytics _analytics = FirebaseAnalytics();

  // ================== Private ==================
  void _logEvent(String name, {Map<String, Object?>? parameters = const {}}) {
    // if (!kDebugMode) {  // TODO- remove before production
      _analytics.logEvent(name: name, parameters: parameters);
    // }
  }

  void _logError(String error) {
    FirebaseCrashlytics.instance.log(error);
  }

  // ================== Logs ==================

  // Pages
  void logAppOpen() {
    // if (!kDebugMode) {  // TODO- remove before production
       _analytics.logAppOpen();
    // }
  }

  // Operations
  void logChangeLanguage(String selectedLanguageCode) {
    _logEvent("LanguageChangedTo${selectedLanguageCode.split("_")[0].toUpperCase()}");
  }

  void logChangeTheme() {
    _logEvent("ThemeChangedTo${Get.isDarkMode ? "Dark" : "Light"}");
  }

  void logReadMoreClicked() {
    _logEvent("ReadMoreClicked");
  }

  void logSearchPlaces() {
    _logEvent("SearchPlaces");
  }

  void logRadiusChanged() {
    _logEvent("RadiusChanged");
  }
}
