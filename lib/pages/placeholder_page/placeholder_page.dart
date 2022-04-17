// ================= Placeholder Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Size size = Size(Get.width, Get.height);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar != null ? appBar! : WikiPlacesAppBar(
        appTitle: true,
      ),
      body: firstIcon == null ? Text(content) :
      Center(
        child: Container(
          width: size.width * 0.7,
          height: size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.35),
            color: Colors.blue,
            boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 5, offset: Offset(5, 5))]
          ),
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: textToken[0] + " ",
                  ),
                  WidgetSpan(
                    child: Icon(firstIcon),
                  ),
                  TextSpan(
                    text: textToken[1],
                  ),
                  WidgetSpan(
                    child: Icon(secondIcon),
                  ),
                  TextSpan(
                    text: textToken[2],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: SearchPlacesFAB(),
    );
  }
}
