// ================= Locale Controller Functions =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/localization/resources/resources.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

class LocaleController {
  static final LocaleController _instance = LocaleController._();
  static LocaleController get instance => _instance;
  LocaleController._();

  static const String _defaultLocale = 'he_IL';
  static final List<String> _supportedLocales = Resources.instance.keys.keys.toList();

  static Locale _buildLocale(String localeCode) {
    List<String> languageToken = localeCode.split('_');
    return Locale(languageToken[0], languageToken[1]);
  }

  static Locale get getDefaultLocale => _buildLocale(_defaultLocale);
  static Locale get getCurrentLocale => localeResolutionCallback(Get.deviceLocale, null)!;

  static Locale? localeResolutionCallback(deviceLocale, _) {
    return _buildLocale(_supportedLocales.contains(deviceLocale.languageCode) ? deviceLocale : _defaultLocale);
  }

  static List<Locale> getSupportedLocales() {
    Locale currentLocale = getCurrentLocale;
    List<Locale> supportedLocales = [currentLocale];

    for (String language in _supportedLocales) {
      Locale locale = _buildLocale(language);

      if (currentLocale != locale) {
        supportedLocales.add(locale);
      }
    }
    return supportedLocales;
  }

  static void changeLanguage(String languageCode) {
    Get.updateLocale(_buildLocale(languageCode));
    GoogleAnalytics.instance.logChangeLanguage(languageCode);
  }
}
