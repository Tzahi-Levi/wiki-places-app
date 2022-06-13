// ================= Settings Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/global/config.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/pages/walkthrough/walkthrough.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/generic_list.dart';
import 'package:wiki_places/widgets/rate_us.dart';
import 'package:wiki_places/widgets/settings/settings_list_arrow.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wiki_places/widgets/languages_drop_down.dart';
import 'package:wiki_places/widgets/theme_switcher.dart';
import 'package:wiki_places/widgets/about_the_app.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void _openInviteFriend() {
    isInviteFriendOpen = true;
    Share.share('strInviteFriendContent'.trParams({'googlePlayUrl': ProjectConfig.googlePlayUrl}), subject: 'strInviteFriendSubject'.tr);
    GoogleAnalytics.instance.logInviteFriendOpened();
  }

  void _openRateUs() {
    Get.dialog(const RateUs());
    GoogleAnalytics.instance.logRateUsOpened();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: WikiPlacesAppBar(),
      body: SingleChildScrollView(
          child: GenericList(
            items: [
              [Text('strDarkMode'.tr, style: Theme.of(context).textTheme.subtitle1), const ThemeSwitcher()],
              [Text('strInviteFriend'.tr, style: Theme.of(context).textTheme.subtitle1), SettingsListArrow(onPressed: _openInviteFriend)],
              [Text('strWatchWalkthrough'.tr, style: Theme.of(context).textTheme.subtitle1), SettingsListArrow(onPressed: () => {navigateToPage(const Walkthrough())})],
              [Text('strRateUs'.tr, style: Theme.of(context).textTheme.subtitle1), SettingsListArrow(onPressed: _openRateUs)],
              [Text('strAboutTheApp'.tr, style: Theme.of(context).textTheme.subtitle1), const AboutTheApp()],
              [Text('strVersion'.tr, style: Theme.of(context).textTheme.subtitle1), Text(ProjectConfig.projectVersion, style: Theme.of(context).textTheme.subtitle1)],
            ],
          ),
      ),
    );
  }
}
