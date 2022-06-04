// ================= Main =================
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wiki_places/controllers/theme_controller.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wiki_places/metrics/sentryController.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wiki_places/localization/locale_controller.dart';
import 'package:wiki_places/localization/resources/resources.dart';
import 'package:wiki_places/global/config.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:wiki_places/pages/image_page/connection_lost.dart';
import 'package:wiki_places/pages/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GoogleAnalytics.instance.logAppOpen();

  await SentryFlutter.init((options) {
      options.dsn = SentryController.sentryDNS;
      options.tracesSampleRate = SentryController.sentryTracesSampleRate;
      options.release = ProjectConfig.projectVersion;
    },
    appRunner: () => runApp(const WikiPlacesApp()),
  );
}

class WikiPlacesApp extends StatelessWidget {
  const WikiPlacesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ProjectConfig.projectName,
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
      theme: ThemeController.lightMode,
      // darkTheme: ThemeController.darkMode,  // TODO- remove for supporting dark mode
      debugShowCheckedModeBanner: false,
      home: ConnectivityBuilder(
        builder: (context, isConnected, status) {
          return (isConnected != null && !!isConnected) ? const HomePage() : const ConnectionLostPage();
        }
      )
    );
  }
}
