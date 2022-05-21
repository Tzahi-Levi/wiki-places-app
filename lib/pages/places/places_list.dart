// ================= Places List =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/pages/placeholder_page/placeholder_page.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/place/place_card.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';
import 'package:wiki_places/pages/places/places_page_collection.dart';

class PlacesList extends StatelessWidget {
  PlacesList({Key? key, required this.placesCollection, this.placeholderContent, this.bottomWidgets}) : super(key: key);
  PlacesPageCollection placesCollection;
  String? placeholderContent;
  List<Widget>? bottomWidgets;

  List<Widget> get _getPlaces {
    List<Widget> placesList = [];
    for (var placeData in placesCollection.places.getRange(0, placesCollection.places.length - 1)) {
      placesList.add(Place(placeData));
    }
    placesList.add(Place(placesCollection.places.last, padding: 20)); // Different behaviour for the last item
    return placesList;
  }

  @override
  Widget build(BuildContext context) {
    return placesCollection.isEmpty && placeholderContent != null ?
      PlaceholderPage(
        content: placeholderContent!,
        appBar: const ShowDetailsAppbar(showAppTitle: true),
      ) : Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const ShowDetailsAppbar(),
        body: ListView(
          children: (bottomWidgets == null) ? _getPlaces : _getPlaces + bottomWidgets!,
        ),
        floatingActionButton: const SearchPlacesFAB(),
    );
  }
}
