// ================= Places Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/pages/placeholder_page/placeholder_page.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/place/place_card.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';
import 'package:wiki_places/widgets/about_the_app.dart';

class PlacesPage extends StatelessWidget {
  PlacesPage({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  List<Widget> _getPlaces() {
    final _places = _storeController.placesCollection.value.places;
    List<Widget> placesList = [];
    for (var placeData in _places.getRange(0, _places.length - 1)) {
      placesList.add(Place(placeData));
    }
    placesList.add(Place(_places.last, padding: 20)); // Different behaviour for the last item
    return placesList;
  }

  void _loadMore() {
    double currentRadius = double.parse(_storeController.radius.value);
    if (currentRadius >= GlobalConstants.maxRadius) {
      displaySnackbar(title: 'strError'.tr, content: 'strCantIncreaseRadius'.trParams({
        'maxRadius': GlobalConstants.maxRadius.toString(),
      }));
      return;
    }

    _storeController.updateIsLoading(true);
    _storeController.changeRadius(min<double>(GlobalConstants.maxRadius, currentRadius + GlobalConstants.defaultLoadMoreStep).toString());
    _storeController.searchPlaces();
    _storeController.updateIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) =>
      _storeController.placesCollection.value.isEmpty ?
      PlaceholderPage(
          content: 'strNoPlacesAvailable'.tr,
          appBar: SearchPlaceAppbar(showAppTitle: true),
      ) : Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SearchPlaceAppbar(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(GlobalConstants.appBackgroundImage),
                    fit: BoxFit.cover,
                ),
              ),
            ),
            ListView(
              children: _getPlaces() + [
                ElevatedButton(onPressed: _loadMore, child: Text('strLoadMore'.tr)),
                const Padding(
                  padding: EdgeInsets.only(bottom: 65.0),
                  child: AboutTheApp(),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: SearchPlacesFAB(),
      ),
    );
  }
}
