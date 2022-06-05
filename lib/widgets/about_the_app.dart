// ================= About The App Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/config.dart';
import 'package:wiki_places/global/constants.dart';

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
        const Divider(),
        ListTile(
          leading: Image.asset(
            GlobalConstants.connectionLostImage,
          ),
          trailing: Text('strLostConnectionImage'.tr),
        ),
        Text(GlobalConstants.connectionLostLink, style: Get.textTheme.headline4),
        ListTile(
          leading: Image.asset(
            GlobalConstants.errorPageImage,
          ),
          trailing: Text('strErrorPageConnection'.tr),
        ),
        Text(GlobalConstants.errorPageLink, style: Get.textTheme.headline4),
        ListTile(
          leading: Image.asset(
            GlobalConstants.locationPermissionPageImage,
          ),
          trailing: Text('strLocationPermissionPage'.tr),
        ),
        Text(GlobalConstants.locationPermissionPageLink, style: Get.textTheme.headline4),
        ListTile(
          leading: Image.asset(
            GlobalConstants.appBackgroundImage,
          ),
          trailing: Text('strBackgroundImage'.tr),
        ),
        Text(GlobalConstants.appBackgroundLink, style: Get.textTheme.headline4),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: _showAboutTheApp, child: Text('strAboutTheApp'.tr));
  }
}
