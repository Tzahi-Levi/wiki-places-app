// ================= Filters Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
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

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  String? _checkEmptyFilter(String? value) {
    return (value == null || value.isEmpty) ? 'strEmptyFilter'.tr : null;
  }

  void _addFilter() async {
    if (_formKey.currentState!.validate() && !_storeController.placeFilters.value.contains(_filterController.text)) {
      _storeController.addPlaceFilter(_filterController.text);
      _filterController.text = "";
      FocusScope.of(Get.context!).unfocus(); // Remove the keyboard
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: SizedBox(
        height: Get.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: Get.back, child: Text('strClose'.tr, style: Get.textTheme.headline5)),
              ],
            ),
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
                IconButton(onPressed: _addFilter, icon: const Icon(GlobalConstants.addIcon), color: Get.theme.primaryColor,),
              ],
            ),
            TextButton(
                onPressed: _storeController.cleanAllFilters,
                child: Text('strCleanAllFilters'.tr, style: Get.textTheme.headline5),
            ),
            SizedBox(
                height: Get.height / 4.9,
                child: SingleChildScrollView(child: TagsList(isWrap: true)),
            ),
          ],
        ),
      ),
    );
  }
}
