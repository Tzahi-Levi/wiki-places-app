// ================= App Background Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wiki_places/global/constants.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(GlobalConstants.appBackgroundImage(isDarkMode: Theme.of(context).brightness == Brightness.dark)),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high
        ),
      ),
    );
  }
}
