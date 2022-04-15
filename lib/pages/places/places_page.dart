// ================= Places Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/widgets/place/place.dart';
import 'package:wiki_places/pages/placeholder_page/placeholder_page.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';

class PlacesPage extends StatelessWidget {
  PlacesPage({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());
  late final TextEditingController _updateRadiusController = TextEditingController(text: _storeController.radius.value);

  void _changeRadius() {
    _storeController.changeRadius(_updateRadiusController.text);
    navigateBack();
  }

  void _openChangeRadiusDialog() {
    openModalBottomSheet(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(  // TODO- change to slider with 5km max
                controller: _updateRadiusController,
              ),
            ),
            Text(GlobalConstants.defaultScale),
          ],
        ),
        ElevatedButton(
          onPressed: _changeRadius,
          child: Text('strChangeRadius'.tr),
        ),
      ]
    );
  }

  List<Place> _getPlaces() {
    List<Place> placesList = [];
    for (var placeData in _storeController.placesCollection.value.places) {
      placesList.add(Place(placeData));
    }
    return placesList;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => _storeController.placesCollection.value.isEmpty ?
      PlaceholderPage(
        content: "abc@", // 'strSetRadius'.tr,  // TODO
        icon: GlobalConstants.searchIcon,
      ) : Scaffold(
            appBar: WikiPlacesAppBar(
              actions: [
                IconButton(
                    onPressed: _openChangeRadiusDialog,
                    icon: const Icon(GlobalConstants.updateRadiusIcon),
                ),
              ],
            ),
            body: ListView(
              children: _getPlaces(),
            ),
            floatingActionButton: SearchPlacesFAB(),
          ),
    );
  }
}
