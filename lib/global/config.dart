// ================= Project Config =================

class ProjectConfig {
  static final ProjectConfig _instance = ProjectConfig._();
  static ProjectConfig get instance => _instance;
  ProjectConfig._();

  // Project Config
  static const String projectName = "WikiPo";
  static const String projectVersion = "v1.1.0";

  // Backend Config
  static const String serverAddress = "132.69.8.15:80";
  static const String serverLanguage = "he";
}
