// ================= Bottom Navigation Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/store_controller.dart';
import 'package:wiki_places/global/types.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_storeController.currentMainAppPage.value == AppPages.places ? GlobalConstants.placesPageSelectedIcon : GlobalConstants.placesPageOutLinedIcon),
            label: 'strPlacesPageName'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(_storeController.currentMainAppPage.value == AppPages.map ? GlobalConstants.mapPageSelectedIcon : GlobalConstants.mapPageOutLinedIcon),
            label: 'strMapPageName'.tr,
          ),
        ],
        currentIndex: _storeController.currentMainAppPage.value.index,
        onTap: _storeController.changeMainAppPage,
      ),
    );
  }
}
