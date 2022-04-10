// ================= Main =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wiki_places/localization/locale_controller.dart';
import 'package:wiki_places/localization/resources/resources.dart';
import 'package:wiki_places/pages/home.dart';

void main() {
  runApp(const WikiPlacesApp());
}

class WikiPlacesApp extends StatelessWidget {
  const WikiPlacesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'strAppName'.tr,
      translations: Resources.instance,
      locale: LocaleController.getCurrentLocale,
      supportedLocales: LocaleController.getSupportedLocales(),
      localeResolutionCallback: (deviceLocale, supportedLocale) => LocaleController.localeResolutionCallback(deviceLocale, supportedLocale),
      fallbackLocale: LocaleController.getDefaultLocale,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: HomePage(),
    );
  }
}
