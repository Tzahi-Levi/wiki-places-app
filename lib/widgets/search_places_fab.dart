// ================= Search Places FAB =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';

class SearchPlacesFAB extends StatelessWidget {
  SearchPlacesFAB({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  void _searchPlaces() async {
    _storeController.updateIsLoading(true);
    await _storeController.searchPlaces(showToast: true);
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          label: Text('strRefresh'.tr, style: Get.textTheme.headline3),
          icon: const Icon(GlobalConstants.refreshIcon),
          onPressed: _searchPlaces,
        ),
      );
  }
}
