// ================= Places Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/pages/placeholder_page/placeholder_page.dart';
import 'package:wiki_places/widgets/appbar.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WikiPlacesAppBar(),
      body: PlaceholderPage(
          content: 'strSetRadius'.tr,
          icon: Icons.search
      ),
    );
  }
}
