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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: _showAboutTheApp, child: Text('strAboutTheApp'.tr));
  }
}
