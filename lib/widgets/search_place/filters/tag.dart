// ================= Tag Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';

class Tag extends StatefulWidget {
  const Tag({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  final StoreController _storeController = Get.put(StoreController());

  void _removeFilter() async {
    _storeController.removePlaceFilter(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4),
      child: Chip(
        backgroundColor: Theme.of(context).focusColor,
        label: Text(widget.title),
        elevation: 3,
        onDeleted: _removeFilter,
      ),
    );
  }
}
