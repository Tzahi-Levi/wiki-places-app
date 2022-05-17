// ================= AppBar Widgets =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/pages/search_place/search_place.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';

class SearchPlaceAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchPlaceAppbar({this.showAppTitle = false, this.title, this.afterSearchCallback, Key? key}) : super(key: key);
  final bool showAppTitle;
  final String? title;
  final Function? afterSearchCallback;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _openSearchPlacePage() {
    navigateToPage(SearchPlacePage(afterSearchCallback: afterSearchCallback));
  }

  @override
  Widget build(BuildContext context) {
    return WikiPlacesAppBar(
      showAppTitle: showAppTitle,
      title: title,
      actions: [
        IconButton(
          onPressed: displayCurrentPlaceDetails,
          icon: Icon(GlobalConstants.infoIcon, size: 25, color: Get.isDarkMode ? Colors.white : const Color(0xff393F36)),
        ),
        IconButton(
          onPressed: _openSearchPlacePage,
          icon: Icon(GlobalConstants.searchIcon, size: 25, color: Get.isDarkMode ? Colors.white : const Color(0xff393F36)),
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
      case EAppPages.places:
      case EAppPages.map:
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
