// ================= Google Analytics Wrapper =================
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class GoogleAnalytics {
  static final GoogleAnalytics _instance = GoogleAnalytics._();
  static GoogleAnalytics get instance => _instance;
  GoogleAnalytics._();

  static final FirebaseAnalytics _analytics = FirebaseAnalytics();

  // ================== Private ==================
  void _logEvent(String name, {Map<String, Object?>? parameters = const {}}) {
    if (!kDebugMode) {
      _analytics.logEvent(name: name, parameters: parameters);
    }
  }

  void _logError(String error) {
    FirebaseCrashlytics.instance.log(error);
  }

  // ================== Logs ==================

  // Pages
  void logAppOpen() {
    if (!kDebugMode) {
       _analytics.logAppOpen();
    }
  }

  // Operations
  void logChangeLanguage(String selectedLanguageCode) {
    _logEvent("LanguageChangedTo${selectedLanguageCode.split("_")[0].toUpperCase()}");
  }

  void logChangeTheme() {
    _logEvent("ThemeChangedTo${Get.isDarkMode ? "Dark" : "Light"}");
  }

  void logWikipediaOpened() {
    _logEvent("WikipediaOpened");
  }

  void logSearchPlaces() {
    _logEvent("SearchPlaces");
  }

  void logRadiusChanged() {
    _logEvent("RadiusChanged");
  }

  void logMapTapped() {
    _logEvent("MapTapped");
  }

  void logPermissionDenied() {
    _logEvent("PermissionDenied");
  }

  void logResponseError() {
    _logEvent("NoResponseError");
  }
}
