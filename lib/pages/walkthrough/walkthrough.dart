// ================= Walkthrough Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough({Key? key}) : super(key: key);

  void _closeWalkthrough({bool isLast = false}) {
    navigateBack();
    isLast ? GoogleAnalytics.instance.logWalkthroughFinished() : GoogleAnalytics.instance.logWalkthroughSkipped();
  }

  PageViewModel _setWalkthroughScreen(String imagePath, String title, String description) {
    return PageViewModel(
      image: SizedBox(
          width: Get.height/3,
          height: Get.height/2,
          child: Image.asset(imagePath)),
      title: title,
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Expanded(child: Text(description, style: Get.textTheme.bodyText2))]),
      decoration: const PageDecoration(
          pageColor: Colors.transparent,
          imageFlex: 3,
          imagePadding: EdgeInsets.all(8),
          titlePadding: EdgeInsets.all(8),
          bodyAlignment: Alignment.topLeft,
      ),
    );
  }

  List<PageViewModel> get _getListOfWalkthroughScreens {
    return [
      _setWalkthroughScreen(
          'images/screenshots/places_page.png',
          "בדיקה",
          "בלה בלה בלה"
      ),
      _setWalkthroughScreen(
          'images/screenshots/favorites_page.png',
          "בדיקה",
          "בלה בלה בלה"
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: _getListOfWalkthroughScreens,
      onDone: () => _closeWalkthrough(isLast: true),
      onSkip: () =>_closeWalkthrough(isLast: false),
      showSkipButton: true,
      skip: Text(
        'strSkip'.tr,
        style: Get.textTheme.bodyText2,
      ),
      next: Text(
        'strNext'.tr,
        style: Get.textTheme.bodyText2,
      ),
      done: Text(
        'strFinish'.tr,
        style: Get.textTheme.bodyText2,
      ),
      dotsFlex: 2,
      skipStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Get.theme.primaryColor),
      ),
      controlsPadding: const EdgeInsets.fromLTRB(5, 16, 5, 16),
      dotsDecorator: DotsDecorator(
          size: const Size.square(7.5),
          activeSize: const Size(15, 7.5),
          activeColor: Theme.of(context).toggleableActiveColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 2.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.5),
          )
      ),
    );
  }
}
