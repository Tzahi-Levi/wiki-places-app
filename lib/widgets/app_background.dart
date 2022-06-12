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
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.5, 1],
            colors: [
              Get.theme.primaryColor,
              Get.theme.primaryColorDark,
            ],
        ),
        image: DecorationImage(
          opacity: 0.3,
          image: AssetImage(GlobalConstants.appBackgroundImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
