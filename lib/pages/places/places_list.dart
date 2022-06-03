// ================= Places List =================
import 'package:flutter/material.dart';
import 'package:wiki_places/pages/placeholder_page/placeholder_page.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/place/place_card.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';
import 'package:wiki_places/pages/places/places_page_collection.dart';

class PlacesList extends StatelessWidget {
  PlacesList({Key? key, required this.placesCollection, this.placeholderContent, this.placeholderIcon, this.topWidgets = const [], this.bottomWidgets = const [], this.distanceFromCurrentLocation = false, this.showAppbarDetails = true, this.showAppbarFilters = true}) : super(key: key);
  final PlacesPageCollection placesCollection;
  final String? placeholderContent;
  final IconData? placeholderIcon;
  final List<Widget> topWidgets;
  final List<Widget> bottomWidgets;
  final bool distanceFromCurrentLocation;
  final bool showAppbarDetails;
  final bool showAppbarFilters;
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop(){
    _scrollController.position.moveTo(0);
  }

  List<Widget> get _getPlaces {
    List<Widget> placesList = [];
    for (var placeData in placesCollection.places.getRange(0, placesCollection.places.length - 1)) {
      placesList.add(Place(placeData, isCurrentLocation: distanceFromCurrentLocation));
    }
    placesList.add(Place(placesCollection.places.last, padding: 20, isCurrentLocation: distanceFromCurrentLocation)); // Different behaviour for the last item
    return placesList;
  }

  @override
  Widget build(BuildContext context) {
    return placesCollection.isEmpty && placeholderContent != null ?
      PlaceholderPage(
        content: placeholderContent!,
        topWidgets: topWidgets,
        appBar: DetailsAndFiltersAppbar(showAppbarDetails: showAppbarDetails, showAppTitle: true, showAppbarFilters: showAppbarFilters),
        firstIcon: placeholderIcon,
      ) : Scaffold(
      backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: DetailsAndFiltersAppbar(showAppbarDetails: showAppbarDetails, showAppbarFilters: showAppbarFilters),
        body: ListView(
          key: Key(placesCollection.length.toString()),
          controller: _scrollController,
          children: [...topWidgets, ..._getPlaces, ...bottomWidgets, const SizedBox(height: 60,)],
        ),
        floatingActionButton: SearchPlacesFAB(afterSearchCallback: _scrollToTop),
    );
  }
}
