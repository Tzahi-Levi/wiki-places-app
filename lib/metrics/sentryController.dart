// ================= Sentry Wrapper =================
import 'package:sentry/sentry.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryController {
  static final SentryController _instance = SentryController._();
  static SentryController get instance => _instance;
  SentryController._();

  static const String sentryDNS = 'https://1db9fbae2f7941d888994c51beaaf7c5@o1092925.ingest.sentry.io/6331418';
  static const double sentryTracesSampleRate = 1.0;

  static void logException(Object e, dynamic stackTrace) {
    Sentry.captureException(e, stackTrace: stackTrace);
  }
}
