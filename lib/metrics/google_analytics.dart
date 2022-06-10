// ================= Google Analytics Wrapper =================
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class GoogleAnalytics {
  static final GoogleAnalytics instance = GoogleAnalytics._();
  GoogleAnalytics._();

  static final FirebaseAnalytics _analytics = FirebaseAnalytics();

  // ================== Private ==================
  void _logEvent(String name, {Map<String, Object?>? parameters = const {}}) {
    if (!kDebugMode) {
      _analytics.logEvent(name: name, parameters: parameters);
    }
  }

  void logError(String error) {
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

  void logChangeTheme({required bool isDarkMode}) {
    _logEvent("ThemeChangedTo${isDarkMode ? "Dark" : "Light"}");
  }

  void logWikipediaOpened() {
    _logEvent("WikipediaOpened");
  }

  void logPlacesCollection() {
    _logEvent("PlacesCollection");
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

  void logFilterAdded() {
    _logEvent("FilterAdded");
  }

  void logFilterRemoved() {
    _logEvent("FilterRemoved");
  }

  void logCurrentPlaceMode() {
    _logEvent("CurrentPlaceMode");
  }

  void logOtherPlaceMode() {
    _logEvent("OtherPlaceMode");
  }

  void logAddFavorite() {
    _logEvent("AddFavorite");
  }

  void logRemoveFavorite() {
    _logEvent("RemoveFavorite");
  }

  void logWalkthroughFinished() {
    _logEvent("WalkthroughFinished");
  }

  void logWalkthroughSkipped() {
    _logEvent("WalkthroughSkipped");
  }

  void logInviteFriendOpened() {
    _logEvent("InviteFriendOpened");
  }

  void logRateUsOpened() {
    _logEvent("RateUsOpened");
  }

  void logRateUsCancel() {
    _logEvent("RateUsCancel");
  }

  void logRateUsSubmit() {
    _logEvent("RateUsSubmit");
  }
}
