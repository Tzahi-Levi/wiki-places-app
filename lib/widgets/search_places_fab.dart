// ================= Search Places FAB =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/pages/search_place/search_place.dart';

class SearchPlacesFAB extends StatelessWidget {
  const SearchPlacesFAB({Key? key, this.afterSearchCallback}) : super(key: key);
  final Function? afterSearchCallback;

  void _openSearchPlacePage() {
    navigateToPage(SearchPlacePage(afterSearchCallback: afterSearchCallback));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FloatingActionButton.extended(
        label: Text('strSearch'.tr, style: Theme.of(context).textTheme.headline3),
        icon: const Icon(GlobalConstants.searchIcon),
        onPressed: _openSearchPlacePage,
      ),
    );
  }
}
