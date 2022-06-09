// ================= Generic Image Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/controllers/theme_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/controllers/favorites_controller.dart';
import 'package:wiki_places/controllers/location_controller.dart';
import 'package:wiki_places/pages/image_page/location_permission_page.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/pages/image_page/generic_image_page.dart';
import 'package:wiki_places/controllers/preferences_controller.dart';
import 'package:wiki_places/pages/walkthrough/walkthrough.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _storeController = Get.put(StoreController());

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    if (await LocationController.isLocationPermission()) {
      await FavoritesController.instance.getFavoritePlaces();
      await _storeController.initPlaces();
      ThemeController.setTheme(isDarkMode: await PreferencesController.instance.getIsDarkMode);
      _storeController.updateMainAppPage(GlobalConstants.defaultAppPage);
      _showWalkthroughIfNeeded();

    } else {
      navigateWithNoBack(const LocationPermissionPage());
    }
  }

  void _showWalkthroughIfNeeded() async {
    if (!await PreferencesController.instance.wasWalkthroughSeen) {
      PreferencesController.instance.setWalkthroughSeen();
      navigateToPage(const Walkthrough());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GenericImagePage(image: GlobalConstants.splashPageImage);
  }
}
