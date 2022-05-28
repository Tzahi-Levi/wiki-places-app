// ================= Filters Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/widgets/search_place/filters/tags_list.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final _storeController = Get.put(StoreController());
  final TextEditingController _filterController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _addIsLoading = false;
  bool _cleanAllIsLoading = false;

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  void _updateIsLoading({bool? addValue, bool? cleanAllValue}) {
    if (addValue != null) {
      setState(() {
        _addIsLoading = addValue;
      });
    }

    if (cleanAllValue != null) {
      setState(() {
        _cleanAllIsLoading = cleanAllValue;
      });
    }
  }

  String? _checkEmptyFilter(String? value) {
    return (value == null || value.isEmpty) ? 'strEmptyFilter'.tr : null;
  }

  void _addFilter() async {
    if (_formKey.currentState!.validate()) {
      _updateIsLoading(addValue: true);
      if (await _storeController.addPlaceFilter(_filterController.text)) {
        _filterController.text = "";
        FocusScope.of(Get.context!).unfocus(); // Remove the keyboard
      }
      _updateIsLoading(addValue: false);
    }
  }

  void _cleanAllFilters() async {
    _updateIsLoading(cleanAllValue: true);
    await _storeController.cleanAllFilters();
    _updateIsLoading(cleanAllValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Text('strFilters'.tr),
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _filterController,
                      validator: _checkEmptyFilter,
                      decoration: InputDecoration(
                        hintText: 'strAddFilter'.tr,
                      ),
                    ),
                  ),
                ),
                _addIsLoading ? const CircularProgressIndicator() : IconButton(onPressed: _addFilter, icon: const Icon(GlobalConstants.addIcon)),
              ],
            ),
            _cleanAllIsLoading ? const CircularProgressIndicator() : TextButton(onPressed: _cleanAllFilters, child: Text('strCleanAllFilters'.tr)),
            TagsList(isWrap: true),
          ],
    );
  }
}
