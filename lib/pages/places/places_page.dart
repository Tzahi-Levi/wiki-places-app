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

class PlacesPage extends StatefulWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  final _storeController = Get.put(StoreController());

  List<Widget> get _getPlaces {
    final _places = _storeController.placesCollection.value.places;
    List<Widget> placesList = [];
    for (var placeData in _places.getRange(0, _places.length - 1)) {
      placesList.add(Place(placeData));
    }
    placesList.add(Place(_places.last, padding: 20)); // Different behaviour for the last item
    return placesList;
  }

  void _loadMore() async {
    _storeController.updateGlobalIsLoading(true);
    double currentRadius = double.parse(_storeController.radius.value);

    if (currentRadius >= GlobalConstants.maxRadius) {
      displaySnackbar(title: 'strError'.tr, content: 'strCantIncreaseRadius'.trParams({
        'maxRadius': GlobalConstants.maxRadius.toString(),
      }));

    } else {
      _storeController.updateRadius(min<double>(GlobalConstants.maxRadius, currentRadius + GlobalConstants.defaultLoadMoreStep).toString());
      await _storeController.updatePlacesCollection();
    }
    _storeController.updateGlobalIsLoading(false);
  }

  void _rebuildPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => _storeController.placesCollection.value.isEmpty ?
      PlaceholderPage(
          content: 'strNoPlacesAvailable'.tr,
          appBar: const SearchPlaceAppbar(showAppTitle: true),
      ) : Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SearchPlaceAppbar(afterSearchCallback: _rebuildPage),
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
              children: _getPlaces + [
                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.33, right: Get.width * 0.33),
                  child: ElevatedButton(onPressed: _loadMore, child: Text('strLoadMore'.tr)),
                ),
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
