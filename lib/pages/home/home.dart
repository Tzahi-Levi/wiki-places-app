// ================= Home Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/pages/settings/settings.dart';
import 'package:wiki_places/pages/splash/splash.dart';
import 'package:wiki_places/widgets/app_background.dart';
import 'package:wiki_places/pages/places/places_page.dart';
import 'package:wiki_places/pages/favorites/favorites_page.dart';
import 'package:wiki_places/pages/map/map.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/widgets/bottom_navigation.dart';

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
      _storeController.initPlaces(resetCurrentPlace: false, moveToError: false);
    }
  }

  Widget get _getCurrentPage {
    switch (_storeController.currentMainAppPage.value) {
      case EAppPages.splash:
        return const SplashPage();
        
      case EAppPages.map:
        return const MapPage();

      case EAppPages.favorites:
        return FavoritesPage();

      case EAppPages.settings:
        return const SettingsPage();

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
            bottomNavigationBar: Visibility(visible: _storeController.currentMainAppPage.value != EAppPages.splash, child: BottomNavigation()),
            body: LoadingOverlay(
              isLoading: _storeController.globalIsLoading.value,
              child: Stack(
                children: [
                  const AppBackground(),
                  _getCurrentPage,
                ],
              ),
            ),
        ),
    );
  }
}
