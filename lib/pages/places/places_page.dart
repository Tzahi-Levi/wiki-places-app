// ================= Places Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/widgets/change_radius_appbar.dart';
import 'package:wiki_places/widgets/place/place.dart';
import 'package:wiki_places/pages/placeholder_page/placeholder_page.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';

class PlacesPage extends StatelessWidget {
  PlacesPage({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  List<Place> _getPlaces() {
    final _places = _storeController.placesCollection.value.places;
    List<Place> placesList = [];
    for (var placeData in _places.getRange(0, _places.length - 1)) {
      placesList.add(Place(placeData));
    }
    placesList.add(Place(_places.last, padding: 80,)); // Different behaviour for the last item
    return placesList;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => _storeController.placesCollection.value.isEmpty
          ? PlaceholderPage(
              content: 'strSetRadius'.tr,
              firstIcon: GlobalConstants.searchIcon,
              secondIcon: GlobalConstants.updateRadiusIcon,
              appBar: ChangeRadiusAppbar(appTitle: true),
            )
          : Scaffold(
              extendBodyBehindAppBar: true,
              appBar: ChangeRadiusAppbar(),
              body: ListView(
                children: _getPlaces(),
              ),
              floatingActionButton: SearchPlacesFAB(),
            ),
    );
  }
}
