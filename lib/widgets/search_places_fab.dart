// ================= Search Places FAB =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/client_requests.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';

class SearchPlacesFAB extends StatelessWidget {
  SearchPlacesFAB({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  void _searchPlaces() async {
    print("azAZ".runes);
    print(await ClientRequests.instance.getSuggestions(pattern: "מגד"));
    return;


    _storeController.updateGlobalIsLoading(true);
    await _storeController.updatePlacesCollection();
    displaySearchSuccessfully();
    _storeController.updateGlobalIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: FloatingActionButton.extended(
        label: Text('strRefresh'.tr, style: Get.textTheme.headline3),
        icon: const Icon(GlobalConstants.refreshIcon),
        onPressed: _searchPlaces,
      ),
    );
  }
}
