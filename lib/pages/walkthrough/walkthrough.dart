// ================= Walkthrough Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough({Key? key}) : super(key: key);

  void _closeWalkthrough({bool isLast = false}) {
    navigateBack();
    isLast ? GoogleAnalytics.instance.logWalkthroughFinished() : GoogleAnalytics.instance.logWalkthroughSkipped();
  }

  PageViewModel _setWalkthroughScreen({required String imagePath, required String title, required String description}) {
    return PageViewModel(
      image: SizedBox(
        width: Get.height / 3,
        height: Get.height / 1.6,
        child: Image.asset(imagePath),
      ),
      title: title,
      bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Expanded(child: Text(description, style: Get.textTheme.bodyText2))]),
      decoration: PageDecoration(
        pageColor: Get.theme.primaryColor.withOpacity(0.2),
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
          imagePath: '${GlobalConstants.walkthroughPathPrefix}${'strLanguageCode'.tr}/Welcome.png',
          title: 'strWelcomeTitle'.tr,
          description: 'strWelcomeDescription'.tr
      ),
      _setWalkthroughScreen(
          imagePath: '${GlobalConstants.walkthroughPathPrefix}${'strLanguageCode'.tr}/List.png',
          title: 'strWalkthroughMainPageTitle'.tr,
          description: 'strWalkthroughMainPageDescription'.tr
      ),
      _setWalkthroughScreen(
          imagePath: '${GlobalConstants.walkthroughPathPrefix}${'strLanguageCode'.tr}/Search.png',
          title: 'strWalkthroughSearchPageTitle'.tr,
          description: 'strWalkthroughSearchPageDescription'.tr
      ),
      _setWalkthroughScreen(
          imagePath: '${GlobalConstants.walkthroughPathPrefix}${'strLanguageCode'.tr}/Map.png',
          title: 'strWalkthroughMapPageTitle'.tr,
          description: 'strWalkthroughMapPageDescription'.tr
      ),
      _setWalkthroughScreen(
          imagePath: '${GlobalConstants.walkthroughPathPrefix}${'strLanguageCode'.tr}/Favorites.png',
          title: 'strWalkthroughFavoritesPageTitle'.tr,
          description: 'strWalkthroughFavoritesPageDescription'.tr
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
      nextStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Get.theme.primaryColor.withOpacity(0.7)),
      ),
      doneStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Get.theme.primaryColor.withOpacity(0.7)),
      ),
      controlsPadding: const EdgeInsets.fromLTRB(5, 16, 5, 16),
      dotsDecorator: DotsDecorator(
          size: const Size.square(7.5),
          activeSize: const Size(15, 7.5),
          activeColor: Get.theme.primaryColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 2.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.5),
          )
      ),
    );
  }
}
