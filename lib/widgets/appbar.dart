// ================= AppBar Widgets =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/search_place/filters/filters.dart';

class DetailsAndFiltersAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAndFiltersAppbar({this.showAppTitle = false, this.showAppbarFilters = true, this.showAppbarDetails = true, this.title, this.leadingAction, Key? key}) : super(key: key);
  final bool showAppTitle;
  final String? title;
  final bool showAppbarDetails;
  final bool showAppbarFilters;
  final Widget? leadingAction;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _openFilters() {
    openModalBottomSheet(widget: const Filters());
  }

  @override
  Widget build(BuildContext context) {
    return WikiPlacesAppBar(
      showAppTitle: showAppTitle,
      title: title,
      actions: [
        Visibility(
          visible: showAppbarDetails,
          child: IconButton(
            onPressed: displayCurrentPlaceDetails,
            icon: Icon(GlobalConstants.infoIcon, size: 25, color: Get.isDarkMode ? Colors.white : const Color(0xff393F36)),
          ),
        ),
        Visibility(
          visible: showAppbarFilters,
          child: IconButton(
            onPressed: _openFilters,
            icon: Icon(GlobalConstants.filtersIcon, size: 25, color: Get.isDarkMode ? Colors.white : const Color(0xff393F36)),
          ),
        ),
      ],
      leadingAction: leadingAction,
    );
  }
}

class WikiPlacesAppBar extends StatelessWidget implements PreferredSizeWidget {
  WikiPlacesAppBar({this.showAppTitle = false, this.title, this.actions = const [], this.leadingAction, Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());
  final bool showAppTitle;
  final String? title;
  final List<Widget> actions;
  final Widget? leadingAction;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String get _getAppBarTitle {
    switch (_storeController.currentMainAppPage.value) {
      case EAppPages.favorites:
        if (_storeController.favoritePlacesCollection.value.length == 1) {
          return 'strFavoriteNumber'.tr;
        }
        return _storeController.favoritePlacesCollection.value.isEmpty ? 'strEmptyFavoriteNumber'.tr : 'strFavoritesNumber'.trParams({
          'number': _storeController.favoritePlacesCollection.value.length.toString(),
        });

      case EAppPages.settings:
        return 'strSettings'.tr;

      case EAppPages.places:
      case EAppPages.map:
      if (_storeController.filteredPlacesCollection.value.length == 1) {
        return 'strWikipediaValueInRadius'.trParams({
          'number': _storeController.filteredPlacesCollection.value.length.toString(),
          'radius': _storeController.radius.value,
          'scale': GlobalConstants.defaultScale,
        });
      }
        return (_storeController.filteredPlacesCollection.value.isEmpty ? 'strEmptyWikipediaValueInRadius' : 'strWikipediaValuesInRadius').trParams({
          'number': _storeController.filteredPlacesCollection.value.length.toString(),
          'radius': _storeController.radius.value,
          'scale': GlobalConstants.defaultScale,
        });

      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
        builder: (store) => AppBar(
      title: Text(_getAppBarTitle, style: Get.textTheme.headline1),
      centerTitle: true,
      actions: actions,
      leading: leadingAction,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
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
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
