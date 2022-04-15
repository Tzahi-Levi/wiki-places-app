// ================= Search Places FAB =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';

class SearchPlacesFAB extends StatelessWidget {
  SearchPlacesFAB({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(GlobalConstants.searchIcon),
      onPressed: _storeController.searchPlaces,
    );
  }
}
