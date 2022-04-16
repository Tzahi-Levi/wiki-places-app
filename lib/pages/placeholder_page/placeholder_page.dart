// ================= Placeholder Page =================
import 'package:flutter/material.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({this.content = "", this.firstIcon, this.secondIcon, this.appBar, Key? key}) : super(key: key);
  final String content;
  final IconData? firstIcon;
  final IconData? secondIcon;
  final PreferredSizeWidget? appBar;

  List<String> _getTextToken() {
    List<String> textToken = [];
    List<String> firstTokens = content.split(GlobalConstants.firstIconTextSeparator);
    textToken.addAll([firstTokens[0], ...firstTokens[1].split(GlobalConstants.secondIconTextSeparator)]);
    return textToken;
  }

  @override
  Widget build(BuildContext context) {
    List<String> textToken = _getTextToken();

    return Scaffold(
      appBar: appBar != null ? appBar! : WikiPlacesAppBar(
        appTitle: true,
      ),
      body: firstIcon == null ? Text(content) :
      Row(
        children: [
          Text(textToken[0]),
          Icon(firstIcon),
          Text(textToken[1]),
          Icon(secondIcon),
          Text(textToken[2]),
        ],
      ),
      floatingActionButton: SearchPlacesFAB(),
    );
  }
}
