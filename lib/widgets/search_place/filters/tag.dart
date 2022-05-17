// ================= Tag Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/utils.dart';

class Tag extends StatelessWidget {
  Tag({required this.title, this.undoCallback, Key? key}) : super(key: key);
  final String title;
  final Function? undoCallback;
  final StoreController _storeController = Get.put(StoreController());

  void _removeFilter() {
    _storeController.removePlaceFilter(title);
    if (undoCallback != null) {
      displayUndoSnackbar(content: 'strFilterRemoved'.tr, callback: _undoCallback);
    }
  }

  void _undoCallback() {
    if (Get.isSnackbarOpen) {
      navigateBack();
    }
    undoCallback!(title);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Chip(
        backgroundColor: const Color(0xfffeffc3),
        label: Text(title),
        elevation: 3,
        onDeleted: _removeFilter,
      ),
    );
  }
}
