// ================= App Background Widget =================
import 'package:flutter/material.dart';
import 'package:wiki_places/global/constants.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(GlobalConstants.appBackgroundImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
