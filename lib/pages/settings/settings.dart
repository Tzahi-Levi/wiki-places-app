// ================= Settings Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/config.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/generic_list.dart';
import 'package:wiki_places/widgets/languages_drop_down.dart';
import 'package:wiki_places/widgets/theme_switcher.dart';
import 'package:wiki_places/widgets/about_the_app.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  // Widget _getSettingsArrow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: const [
  //       Icon(gc.settingArrow),
  //     ],
  //   );
  // }
  //
  //
  // void _inviteFriend() {
  //   Share.share(Languages.of(context)!.strInviteFriendContent.replaceAll("%", gc.googlePlayURL), subject: Languages.of(context)!.strInviteFriendSubject);
  //   GoogleAnalytics.instance.logInviteFriendOpened();
  // }
  //
  // void _openRateUs() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => RateUs(),
  //   );
  //   GoogleAnalytics.instance.logRateUsOpened();
  // }
  //
  // Row leadingWidgetWithInfo(String settingName, String tip) {
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Text(settingName),
  //       GenericTooltip(tip: tip),
  //     ],
  //   );
  // }
  //
  // Widget _getConstantsList() {
  //   List<Widget?> leadingSettings = [
  //     Text(
  //       Languages.of(context)!.strConstants,
  //       style: Theme.of(context).textTheme.subtitle1,
  //     ),
  //     Text(Languages.of(context)!.strWatchWalkthrough),
  //     Text(Languages.of(context)!.strInviteFriend),
  //     Text(Languages.of(context)!.strRateUs),
  //     Text(Languages.of(context)!.strAbout),
  //     leadingWidgetWithInfo(Languages.of(context)!.strEndOfMonthSettings, Languages.of(context)!.strEndOfMonthInfo),
  //     Text(Languages.of(context)!.strVersionSettings),
  //   ];
  //   List<Widget?> trailingSettings = [
  //     null,
  //     IconButton(
  //       onPressed: _showWalkthrough,
  //       icon: _getSettingsArrow(),
  //     ),
  //     IconButton(
  //       onPressed: _inviteFriend,
  //       icon: _getSettingsArrow(),
  //     ),
  //     IconButton(
  //       onPressed: _openRateUs,
  //       icon: _getSettingsArrow(),
  //     ),
  //     IconButton(
  //       onPressed: _getAbout,
  //       icon: _getSettingsArrow(),
  //     ),
  //     _getDaysOfMonthRadio(),
  //     Text(config.projectVersion, style: Theme.of(context).textTheme.bodyText2)
  //   ];
  //   return ListViewGeneric(
  //     leadingWidgets: leadingSettings,
  //     trailingWidgets: trailingSettings,
  //     isScrollable: false,
  //   );
  // }
  //
  // Widget _getSettingsList() {
  //   List<Widget?> leadingSettings = [
  //     widget.authRepository.status == AuthStatus.Authenticated ? Text(Languages.of(context)!.strProfile) : null,
  //     widget.authRepository.status == AuthStatus.Authenticated ? Text(Languages.of(context)!.strPasswordSettings) : null,
  //     widget.authRepository.status == AuthStatus.Authenticated ? Text(Languages.of(context)!.strCurrencySettings) : null,
  //     widget.authRepository.status == AuthStatus.Authenticated ? leadingWidgetWithInfo(Languages.of(context)!.strSendMonthlyReport, Languages.of(context)!.strSendMonthlyReportInfo) : null,
  //     Text(Languages.of(context)!.strLanguageSettings),
  //     Text(Languages.of(context)!.strDarkModeSettings),
  //   ];
  //
  //   List<Widget?> trailingSettings = [
  //     widget.authRepository.status != AuthStatus.Authenticated ? null :
  //     IconButton(
  //       onPressed: _openProfileSettings,
  //       icon: _getSettingsArrow(),
  //     ),
  //     widget.authRepository.status != AuthStatus.Authenticated ? null :
  //     IconButton(
  //       onPressed: _openChangePassword,
  //       icon: _getSettingsArrow(),
  //     ),
  //     widget.authRepository.status != AuthStatus.Authenticated ? null :
  //     GenericRadioButton(CurrencySign.values.toList(), _currencyController, onChangeCallback: _changeCurrency),
  //     (widget.authRepository.status != AuthStatus.Authenticated || widget.userStorage.userData == null) ? null :
  //     Checkbox(value: widget.userStorage.userData!.sendReport, onChanged: _toggleSendEmail),
  //     const LanguageDropDown(),
  //     DarkModeSwitcher(globalIsDarkMode),
  //   ];
  //
  //   return ListViewGeneric(leadingWidgets: leadingSettings, trailingWidgets: trailingSettings, isScrollable: false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WikiPlacesAppBar(),
      body: SingleChildScrollView(
          child: GenericList(
            items: [
              [Text('strAboutTheApp'.tr),
                const AboutTheApp()],
              [Text('strVersion'.tr),
                const Text(ProjectConfig.projectVersion)],
            ],
          )
      ),
    );
  }
}