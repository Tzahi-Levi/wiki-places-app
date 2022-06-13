// ================= About The App Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/config.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/widgets/settings/settings_list_arrow.dart';

class AboutTheApp extends StatelessWidget {
  const AboutTheApp({Key? key}) : super(key: key);

  void _showAboutTheApp() {
    showAboutDialog(
      context: Get.context!,
      applicationName: 'strAppName'.tr,
      applicationVersion: ProjectConfig.projectVersion,
      applicationIcon: Image.asset(
        GlobalConstants.appIconImage,
        width: 80,
        height: 80,
      ),
      applicationLegalese: 'strLegalese'.tr,
      children: [
        Text('strCredit'.tr),
        Center(child: Image.asset(GlobalConstants.labIconImage)),
        const Divider(),
        ListTile(
          leading: Text('strLostConnectionImage'.tr),
          trailing: Image.asset(GlobalConstants.connectionLostImage),
        ),
        Text(GlobalConstants.connectionLostLink, style: Get.textTheme.headline4),
        ListTile(
          leading: Text('strErrorPageConnection'.tr),
          trailing: Image.asset(GlobalConstants.errorPageImage),
        ),
        Text(GlobalConstants.errorPageLink, style: Get.textTheme.headline4),
        ListTile(
          leading: Text('strLocationPermissionPage'.tr),
          trailing: Image.asset(GlobalConstants.locationPermissionPageImage),
        ),
        Text(GlobalConstants.locationPermissionPageLink, style: Get.textTheme.headline4),
        ListTile(
          leading: Text('strBackgroundImage'.tr),
          trailing: Image.asset(GlobalConstants.appBackgroundImage()),
        ),
        Text(GlobalConstants.appBackgroundLink, style: Get.textTheme.headline4),
        ListTile(
          leading: Text('strSplashImage'.tr),
          trailing: Image.asset(GlobalConstants.splashPageImage),
        ),
        Text(GlobalConstants.splashBackgroundLink, style: Get.textTheme.headline4),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsListArrow(onPressed: _showAboutTheApp);
  }
}
