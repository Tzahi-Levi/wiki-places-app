// ================= Map Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wiki_places/controllers/location_controller.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/widgets/change_radius_appbar.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());
  late final GoogleMapController _controller;
  late Json currentLocation = {"lat": 0.0, "lon": 0.0};

  void _onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    currentLocation = await LocationController.getLocation();
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(currentLocation["lat"], currentLocation["lon"]),
            zoom: GlobalConstants.defaultZoomMap),
      ),
    );
  }

  void _onInfoTapped(String placeURL) {
    openWikipedia(placeURL);
    GoogleAnalytics.instance.logMapTapped();
  }

  Set<Marker> _getMarkers() {
    Set<Marker> places = {};

    for (var place in _storeController.placesCollection.value.places) {
      places.add(Marker(
        markerId: MarkerId(place.label),
        position: LatLng(place.lat, place.lon),
        infoWindow: InfoWindow(
          title: place.label,
          snippet: 'strReadMore'.tr,
          onTap: () {
            _onInfoTapped(place.url);
          },
        ),
      ));
    }

    return places;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ChangeRadiusAppbar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 108),
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
                target: GlobalConstants.defaultInitialMapLocation,
                zoom: GlobalConstants.defaultZoomMap),
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            markers: _getMarkers(),
            circles: {Circle( circleId: CircleId('currentCircle'),
              center: LatLng(currentLocation["lat"], currentLocation["lon"]),
              radius: double.parse(_storeController.radius.value)*1000,
              fillColor: Colors.blue.shade100.withOpacity(0.5),
              strokeWidth: 2,
              strokeColor:  Colors.blue.shade100,
            ),},
          ),
        ),
        floatingActionButton: SearchPlacesFAB(),
      ),
    );
  }
}
