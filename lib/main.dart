// ================= Main =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wiki_places/localization/locale_controller.dart';
import 'package:wiki_places/localization/resources/resources.dart';
import 'package:wiki_places/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleAnalytics.instance.logAppOpen();
  runApp(WikiPlacesApp());
}

class WikiPlacesApp extends StatelessWidget {
  WikiPlacesApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(body: Center(child: Text(snapshot.error.toString())));
          }

          return (snapshot.connectionState != ConnectionState.done) ? const Center(child: CircularProgressIndicator()) : GetMaterialApp(
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
      );
    }
}
