// ================= Places Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/place/place_card.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';
import 'package:wiki_places/widgets/about_the_app.dart';
import 'package:wiki_places/global/constants.dart';

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
    _storeController.changeRadius(min<double>(GlobalConstants.maxRadius, double.parse(_storeController.radius.value) + GlobalConstants.defaultLoadMoreStep).toString());
    _storeController.searchPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SearchPlaceAppbar(),
        body: _storeController.placesCollection.value.isEmpty ? Container() : Stack(
          children: [Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(GlobalConstants.appBackgroundImage), fit: BoxFit.cover)
            ),
          ),
          ListView(
            _getPlaces() + [
              Visibility(
                visible: double.parse(_storeController.radius.value) <= GlobalConstants.maxRadius - 1,
                child: ElevatedButton(onPressed: _loadMore, child: Text('strLoadMore'.tr)),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 65.0),
                child: AboutTheApp(),
              )
            ],
          )],
        ),
        floatingActionButton: SearchPlacesFAB(),
      ),
    );
  }
}
