// ================= AppBar Widgets =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';

class WikiPlacesAppBar extends StatelessWidget implements PreferredSizeWidget {
  WikiPlacesAppBar({this.appTitle = false, this.actions = const [], Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());
  final bool appTitle;
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String _getAppBarTitle() {
    if (!appTitle) {
      switch (_storeController.currentMainAppPage.value) {
        case AppPages.places:
          return 'strWikipediaValuesInRadius'.trParams({
            'radius': _storeController.radius.value,
            'scale': GlobalConstants.defaultScale,
          });

        case AppPages.map:
          return 'strWikipediaValuesInRadius'.trParams({
            'radius': "",
            'scale': "",
          });
      }
    }
    return 'strAppName'.tr;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: Text(_getAppBarTitle()),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: actions,
    );
  }
}
