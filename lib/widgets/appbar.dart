// ================= AppBar Widgets =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/pages/search_place/search_place.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';

class SearchPlaceAppbar extends StatelessWidget implements PreferredSizeWidget {
  SearchPlaceAppbar({this.showAppTitle = false, this.title, Key? key}) : super(key: key);
  final bool showAppTitle;
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _openChangeRadiusDialog() {
    navigateToPage(SearchPlacePage());
  }

  @override
  Widget build(BuildContext context) {
    return WikiPlacesAppBar(
      showAppTitle: showAppTitle,
      title: title,
      actions: [
        IconButton(
          onPressed: _openChangeRadiusDialog,
          icon: const Icon(GlobalConstants.searchIcon, size: 25, color: Colors.white),
        ),
      ],
    );
  }
}

class WikiPlacesAppBar extends StatelessWidget implements PreferredSizeWidget {
  WikiPlacesAppBar({this.showAppTitle = false, this.title, this.actions = const [], Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());
  final bool showAppTitle;
  final String? title;
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String get _getAppBarTitle {
    if (title != null) {
      return title!;
    }

    if (showAppTitle) {
      return 'strAppName'.tr;
    }

    switch (_storeController.currentMainAppPage.value) {
      case AppPages.places:
      case AppPages.map:
        return 'strWikipediaValuesInRadius'.trParams({
          'number': _storeController.placesCollection.value.length.toString(),
          'radius': _storeController.radius.value,
          'scale': GlobalConstants.defaultScale,
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_getAppBarTitle, style: Get.textTheme.headline1),
      centerTitle: true,
      actions: actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
