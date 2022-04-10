// ================= Language Drop Down Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/localization/locale_controller.dart';
import 'package:wiki_places/localization/resources/resources.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({Key? key}) : super(key: key);

  void _changeLanguage(newLocale) {
    if (newLocale != LocaleController.getCurrentLocale) {
      LocaleController.changeLanguage(newLocale);
    }
  }

  List<DropdownMenuItem> _getItems() {
    List<Locale> supportedLocales = LocaleController.getSupportedLocales();
    List<DropdownMenuItem> items = [];

    for (int index = 0; index < supportedLocales.length; index++) {
      String languageCode = Resources.instance.keys.keys.toList()[index];

      items.add(DropdownMenuItem(
        value: languageCode,
        child: Text(Resources.instance.keys[languageCode]!['strLanguageName'].toString()),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Theme.of(context).cardColor,
      hint: Text(
        'strLanguageName'.tr,
        style: TextStyle(
          color: Theme.of(context).splashColor,
          fontSize: 15.0,  // TODO- GC
          fontWeight: FontWeight.bold,
        ),
      ),
      items: _getItems(),
      onChanged: _changeLanguage,
    );
  }
}
