// ================= Placeholder Page =================
import 'package:flutter/material.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({this.content = "", this.icon, Key? key}) : super(key: key);
  final String content;
  final IconData? icon;

  List<String> get iconTextSeparated => content.split(GlobalConstants.iconTextSeparator);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WikiPlacesAppBar(
        appTitle: true,
      ),
      body: icon == null ? Text(content) :
      Row(
        children: [
          Text(iconTextSeparated[0]),
          Icon(icon),
          Text(iconTextSeparated[1])
        ],
      ),
      floatingActionButton: SearchPlacesFAB(),
    );
  }
}
