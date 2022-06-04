// ================= Tag Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/widgets/CustumeCircularProgress.dart';

class Tag extends StatefulWidget {
  const Tag({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  final StoreController _storeController = Get.put(StoreController());
  bool _isLoading = false;

  void _updateIsLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void _removeFilter() async {
    _updateIsLoading(true);
    await _storeController.removePlaceFilter(widget.title);
    _updateIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4),
      child: _isLoading ? const CustomCircularProgress(size:20, padding: 15,) : Chip(
        backgroundColor: const Color(0xff80DF99),
        label: Text(widget.title),
        elevation: 3,
        onDeleted: _removeFilter,
      ),
    );
  }
}
