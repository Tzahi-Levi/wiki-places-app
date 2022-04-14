// ================= Main =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wiki_places/metrics/sentryController.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wiki_places/localization/locale_controller.dart';
import 'package:wiki_places/localization/resources/resources.dart';
import 'package:wiki_places/global/config.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:wiki_places/pages/connection_lost/connection_lost.dart';
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
    appRunner: () => runApp(WikiPlacesApp()),
  );
}

class WikiPlacesApp extends StatelessWidget {
  WikiPlacesApp({Key? key}) : super(key: key);
  final FirebasePerformance performance = FirebasePerformance.instance;

  void _disableCrashlyticsInDebug() async {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  @override
  Widget build(BuildContext context) {
    _disableCrashlyticsInDebug();
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
      home: ConnectivityBuilder(
        builder: (context, isConnected, status) {
          return (isConnected != null && !!isConnected) ? const HomePage() : const ConnectionLostPage();
        }
      )
    );
  }
}
