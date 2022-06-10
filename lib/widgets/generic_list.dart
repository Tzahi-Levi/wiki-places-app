// ================= Generic List =================
import 'package:flutter/material.dart';

class GenericList extends StatelessWidget {
  const GenericList({Key? key, required this.items, this.listTileHeight, this.isScrollable = true}) : super(key: key);

  final List<List<Widget?>> items;
  final double? listTileHeight;
  final bool isScrollable;

  List<Widget> get _getListViewTilesBuild {
    List<Widget> tiles = [];
    for (var i = 0; i < items.length; i++) {
      tiles.add(ListTile(
        leading: items[i][0],
        trailing: items[i][1],
      ));
      tiles.add(const Divider());
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: _getListViewTilesBuild,
      itemExtent: listTileHeight,
      physics: isScrollable ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
    );
  }
}
