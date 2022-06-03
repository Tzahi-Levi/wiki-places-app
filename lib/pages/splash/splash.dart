// ================= Generic Image Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/controllers/favorites_controller.dart';
import 'package:wiki_places/controllers/location_controller.dart';
import 'package:wiki_places/pages/image_page/location_permission_page.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/pages/image_page/generic_image_page.dart';

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
      await _searchPlaces();
      FavoritesController.instance.getFavoritePlaces();
      _storeController.updateMainAppPage(GlobalConstants.defaultAppPage);

    } else {
      navigateWithNoBack(const LocationPermissionPage());
    }
  }

  Future<void> _searchPlaces({bool resetCurrentPlace = true, bool moveToError = true}) async {
    _storeController.updateGlobalIsLoading(true);
    if (resetCurrentPlace) {
      await _storeController.updatePlaceToCurrentMode();
    }
    await _storeController.updatePlacesCollection(moveToError: moveToError, reportToGA: false);
    _storeController.updateGlobalIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return GenericImagePage(image: GlobalConstants.splashPageImage);
  }
}
