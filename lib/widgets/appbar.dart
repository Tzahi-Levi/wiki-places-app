// ================= AppBar Widgets =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/types.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({this.page = AppPages.places, this.actions = const [], Key? key}) : super(key: key);

  final AppPages page;
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  String _getAppBarTitle() {
    return 'strAppName'.tr;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_getAppBarTitle()),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: widget.actions,
    );
  }
}

// MinorAppBar
class MinorAppBar extends StatelessWidget implements PreferredSizeWidget {

  const MinorAppBar({this.title = "", Key? key}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
