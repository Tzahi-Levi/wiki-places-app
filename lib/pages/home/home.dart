// ================= Home Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/widgets/bottom_navigation.dart';
import 'package:wiki_places/pages/places/places_page.dart';
import 'package:wiki_places/pages/map/map.dart';
import 'package:wiki_places/global/types.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final _storeController = Get.put(StoreController());

  @override
  void initState() {
    super.initState();
    _searchPlaces();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _searchPlaces(resetCurrentPlace: false, moveToError: false);
    }
  }

  void _searchPlaces({bool resetCurrentPlace = true, bool moveToError = true}) async {
    _storeController.updateGlobalIsLoading(true);
    if (resetCurrentPlace) {
      _storeController.updatePlaceToCurrentMode();
    }
    await _storeController.updatePlacesCollection(moveToError: moveToError, reportToGA: false);
    _storeController.updateGlobalIsLoading(false);
    FlutterNativeSplash.remove();
  }

  Widget get _getCurrentPage {
    switch (_storeController.currentMainAppPage.value) {
      case EAppPages.map:
        return const MapPage();

      case EAppPages.places:
      default:
        return PlacesPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
        builder: (store) => Scaffold(
            extendBodyBehindAppBar: true,
            body: LoadingOverlay(
              isLoading: _storeController.globalIsLoading.value,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 45.0),
                    child: _getCurrentPage,
                  ),
                  const Positioned(bottom: 0, left: 0, child: BottomNavigation()),
                ],
              ),
            ),
        ),
    );
  }
}
