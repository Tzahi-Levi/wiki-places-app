// ================= AppBar Widgets =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WikiPlacesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WikiPlacesAppBar({this.title, this.actions = const [], Key? key}) : super(key: key);
  final String? title;
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String _getAppBarTitle() {
    return 'strAppName'.tr;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title == null ? _getAppBarTitle() : title!),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: actions,
    );
  }
}
