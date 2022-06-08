// ================= Bottom Navigation Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:wiki_places/global/utils.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  void _navigateToPage(int index) {
    Get.back(closeOverlays: true);
    _storeController.updateMainAppPage(indexToEnum(EAppPages.values, index));
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      height: 60,
      elevation: 10,
      color: Get.theme.unselectedWidgetColor,
      activeColor: Get.theme.primaryColor,
      backgroundColor: Get.theme.primaryColorDark,
      style: TabStyle.react,
      items: [
        TabItem(title: 'strFavoritesPageName'.tr, icon: GlobalConstants.favoriteIcon),
        TabItem(title: 'strPlacesPageName'.tr, icon: GlobalConstants.placesPageSelectedIcon),
        TabItem(title: 'strMapPageName'.tr, icon: GlobalConstants.mapPageSelectedIcon),
        TabItem(title: 'strSettingsName'.tr, icon: GlobalConstants.settingsPageSelectedIcon),
      ],
      initialActiveIndex: 1,
      onTap: _navigateToPage,
    );
  }
}
