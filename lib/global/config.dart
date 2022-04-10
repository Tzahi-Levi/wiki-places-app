// ================= Project Config =================

class ProjectConfig {
  static final ProjectConfig _instance = ProjectConfig._();
  static ProjectConfig get instance => _instance;
  ProjectConfig._();

  // Project Config
  static const String projectName = "WikiPlaces";
  static const String projectVersion = "v1.0.0";

  // Backend Config
  static const String serverAddress = "132.69.8.15:80";

  // Sentry Config
  static const String dsnForSentry = 'https://789c12b26df3418db5e7c6956794189f@o1092925.ingest.sentry.io/6111884';
  static const String releaseName = "com.technion.balanceme.balance_me@" + projectVersion;
  static const String transactionName = "App performance";
  static const String transactionOperation = "obtain information about BalanceMe's performance";
  static const double traceSampleRate = 0.5;
}
