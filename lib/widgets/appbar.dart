// ================= AppBar Widgets =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';

class ShowDetailsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ShowDetailsAppbar({this.showAppTitle = false, this.title, Key? key}) : super(key: key);
  final bool showAppTitle;
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return WikiPlacesAppBar(
      showAppTitle: showAppTitle,
      title: title,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: IconButton(
            onPressed: displayCurrentPlaceDetails,
            icon: Icon(GlobalConstants.infoIcon, size: 25, color: Get.isDarkMode ? Colors.white : const Color(0xff393F36)),
          ),
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
    switch (_storeController.currentMainAppPage.value) {
      case EAppPages.favorites:
        return 'strFavoritesNumber'.trParams({
          'number': _storeController.favoritePlacesCollection.value.length.toString(),
        });

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
    return GetX<StoreController>(
        builder: (store) => AppBar(
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
    ));
  }
}

class MinorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MinorAppBar({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title == null ? 'strAppName'.tr : title!, style: Get.textTheme.headline1),
      centerTitle: true,
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
