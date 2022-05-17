// ================= Map Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';
import 'package:wiki_places/global/map_style/map_style_dark.dart';
import 'package:wiki_places/global/map_style/map_style_light.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _storeController = Get.put(StoreController());
  GoogleMapController? _controller;
  Json _previousStore = {};

  void _updateMap() {
    if (_controller != null) {
      _controller!.setMapStyle(Get.isDarkMode ? mapStyleDark : mapStyleLight);
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _storeController.placeCoordinates.value,
            zoom: GlobalConstants.defaultZoomMap,
          ),
        ),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller = controller;

    setState(() {
      _updateMap();
    });
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

    if (_storeController.placeMode.value == EPlaceMode.other) {
      places.add(Marker(
        markerId: const MarkerId("currentPlace"),
        icon: BitmapDescriptor.defaultMarkerWithHue(GlobalConstants.currentPlaceMarkerColor),
        position: _storeController.placeCoordinates.value,
        infoWindow: InfoWindow(
          title: _storeController.placeName.value,
          snippet: 'strYourChosenPlace'.tr,
        ),
      ));
    }

    return places;
  }

  void _savePreviousStore() {
    _previousStore = {
      'radius': _storeController.radius.value,
      'placeCoordinates': _storeController.placeCoordinates.value,
      'placeName': _storeController.placeName.value,
      'placeMode': _storeController.placeMode.value
    };
  }

  void _restorePreviousStore() {
    _storeController.setStore(_previousStore);
  }

  void _changePlace(LatLng newPlace) async {
    _storeController.updateGlobalIsLoading(true);
    _savePreviousStore();
    if (await _storeController.updatePlaceToSpecificLocation(newPlaceCoordinates: newPlace) && await _storeController.updatePlacesCollection()) {
      displaySearchSuccessfully();
      _updateMap();

    } else {
      _restorePreviousStore();
    }
    _storeController.updateGlobalIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SearchPlaceAppbar(afterSearchCallback: _updateMap),
        body: GoogleMap(
          padding: const EdgeInsets.only(top: 120, bottom: 50),
          onTap: _changePlace,
          initialCameraPosition: CameraPosition(
              target: _storeController.placeCoordinates.value,
              zoom: GlobalConstants.defaultZoomMap,
          ),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          markers: _getMarkers(),
          circles: {
            Circle(
              circleId: const CircleId('currentCircle'),
              center: LatLng(_storeController.placeCoordinates.value.latitude, _storeController.placeCoordinates.value.longitude),
              radius: double.parse(_storeController.radius.value) * 1000, // Convert Km to m
              fillColor: Colors.blue.shade100.withOpacity(0.5),
              strokeWidth: 2,
              strokeColor: Colors.blue.shade100,
            ),
          },
        ),
        floatingActionButton: SearchPlacesFAB(),
      ),
    );
  }
}
