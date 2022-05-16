// ================= Filters Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/search_place/tag.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final _storeController = Get.put(StoreController());
  final TextEditingController _filterController = TextEditingController();

  List<Widget> get _getTags {
    List<Widget> tags = [];
    for (String filter in _storeController.placeFilters.value){
      tags.add(Tag(title: filter, undoCallback: _addFilter));
    }
    return tags;
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  void _addFilter([String? filter]) {
    filter ??= _filterController.text;
    if (filter.isNotEmpty) {
      _storeController.addPlaceFilter(filter!);
      _filterController.text = "";
      FocusScope.of(Get.context!).unfocus(); // Remove the keyboard
    } else {
      displaySnackbar(content: 'strEmptyFilter'.tr, title: 'strError'.tr);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
        builder: (store) => Column(
          children: [
            Text('strFilters'.tr),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _filterController,
                    decoration: InputDecoration(
                      hintText: 'strAddFilter'.tr,
                    ),
                  ),
                ),
                IconButton(onPressed: _addFilter, icon: const Icon(GlobalConstants.addIcon)),
              ],
            ),
            Wrap(
              children: _getTags,
            ),
          ],
        ),
    );
  }
}
