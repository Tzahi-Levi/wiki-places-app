// ================= Home Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addObserver(this);
    }
  }

  @override
  void dispose() {
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _searchPlaces(resetCurrentPlace: false, moveToError: false);
    }
  }

  void _searchPlaces({bool resetCurrentPlace = true, bool moveToError = true}) async {
    _storeController.updateIsLoading(true);
    if (resetCurrentPlace) {
      _storeController.updateCurrentPlace();
    }
    _storeController.searchPlaces(moveToError: moveToError, reportToGA: false);
    _storeController.updateIsLoading(false);
  }

  Widget _openCurrentPage() {
    switch (_storeController.currentMainAppPage.value) {
      case AppPages.map:
        return MapPage();

      case AppPages.places:
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
              isLoading: _storeController.isLoading.value,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 45.0),
                    child: _openCurrentPage(),
                  ),
                  const Positioned(bottom: 0, left: 0, child: BottomNavigation()),
                ],
              ),
            ),
        ),
    );
  }
}
