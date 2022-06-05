// ================= Tags List Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/widgets/search_place/filters/tag.dart';

class TagsList extends StatelessWidget {
  TagsList({required this.isWrap, Key? key}) : super(key: key);
  final bool isWrap;
  final _storeController = Get.put(StoreController());

  List<Widget> get _getTags {
    List<Widget> tags = [];
    for (String filter in _storeController.placeFilters.value) {
      tags.add(Tag(title: filter));
    }
    return tags;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => isWrap ? Wrap(children: _getTags) : Visibility(
        visible: _storeController.placeFilters.value.isNotEmpty,
        child: SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: _getTags,
            ),
        ),
      ),
    );
  }
}
