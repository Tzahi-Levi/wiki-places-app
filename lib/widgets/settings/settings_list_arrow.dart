// ================= Settings List Arrow Widget =================
import 'package:flutter/material.dart';
import 'package:wiki_places/global/constants.dart';

class SettingsListArrow extends StatelessWidget {
  SettingsListArrow({required this.onPressed, Key? key}) : super(key: key);
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: const Icon(GlobalConstants.settingsListIcon));
  }
}
