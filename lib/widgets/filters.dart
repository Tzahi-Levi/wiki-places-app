// ================= Filters Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tags/simple_tags.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final _storeController = Get.put(StoreController());
  final TextEditingController _filterController = TextEditingController();

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  void _addFilter() {  // TODO- add logs to GA
    if (_filterController.text.isNotEmpty) {
      setState(() {
        _storeController.addPlaceFilter(_filterController.text);
        _filterController.text = "";
      });
    }
  }

  void _removeFilter(String filter) {  // TODO- add snackbar with UNDO
    setState(() {
      _storeController.removePlaceFilter(filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            IconButton(onPressed: _addFilter,
                icon: const Icon(GlobalConstants.addIcon)),
          ],
        ),
        SimpleTags(
            content: _storeController.placeFilters.value,
            wrapSpacing: 4,
            wrapRunSpacing: 4,
            onTagPress: _removeFilter,
            tagContainerPadding: const EdgeInsets.all(6),
            tagTextStyle: const TextStyle(color: Colors.deepPurple),
            tagIcon: const Icon(Icons.clear, size: 12),
            tagContainerDecoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(139, 139, 142, 0.16),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1.75, 3.5),
                )
              ],
            ),
        ),
      ],
    );
  }
}
